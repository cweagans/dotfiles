--- === Seal.plugins.apps ===
---
--- A plugin to add launchable apps/scripts, making Seal act as a launch bar
local obj = {}
obj.__index = obj
obj.__name = "seal_sound"

obj.presets = {
  {
    name = "Home Office (Headphones)",
    input = "Producer USB",
    output = "Soundcore Life Q20",
  },
  {
    name = "Home Office (AirPods Max)",
    input = "Producer USB",
    output = "Cameron's AirPods Max",
  },
  {
    name = "Home Office",
    input = "Producer USB",
    output = "TX-384Khz Hifi Type-C Audio",
  },
  {
    name = "Mobile (Headphones)",
    input = "MacBook Pro Microphone",
    output = "Soundcore Life Q20",
  },
  {
    name = "Mobile (AirPods Max)",
    input = "MacBook Pro Microphone",
    output = "Cameron's AirPods Max",
  },
  {
    name = "Built-in hardware",
    input = "MacBook Pro Microphone",
    output = "MacBook Pro Speakers",
  },
}

function obj:commands()
  return {
    sound = {
      cmd = "sound",
      fn = obj.choicesSound,
      name = "Sound",
      description = "Change sound devices to a configured preset.",
      plugin = obj.__name,
    },
  }
end

function obj:bare()
  return nil
end

function obj.choicesSound(query)
  local choices = {}

  for i, deviceinfo in ipairs(obj.presets) do
    local choice = {}

    if query ~= nil and query ~= "" and not string.match(deviceinfo.name:lower(), query:lower()) then
      goto continue
    end

    choice["text"] = deviceinfo.name
    choice["subText"] = "Input: " .. deviceinfo.input .. ", Output: " .. deviceinfo.output
    choice["plugin"] = obj.__name
    choice["type"] = "sound"
    choice["uuid"] = obj.__name .. "__" .. deviceinfo.name
    table.insert(choices, choice)

    ::continue::
  end

  return choices
end

function obj.completionCallback(rowInfo)
  if rowInfo["plugin"] ~= obj.__name then
    return
  end
  if rowInfo["type"] == "sound" then
    for i, deviceinfo in ipairs(obj.presets) do
      if rowInfo["uuid"] == obj.__name .. "__" .. deviceinfo.name then
        if
          not hs.audiodevice.findInputByName(deviceinfo.input) or not hs.audiodevice.findOutputByName(deviceinfo.output)
        then
          hs.notify.show(
            "Required audio devices not found",
            "",
            "The required audio devices for " .. deviceinfo.name .. " are not connected."
          )
          return
        end

        if hs.audiodevice.findInputByName(deviceinfo.input):name() ~= hs.audiodevice.defaultInputDevice():name() then
          hs.audiodevice.findInputByName(deviceinfo.input):setDefaultInputDevice()
          hs.audiodevice.defaultInputDevice():setInputVolume(100)
        end

        if hs.audiodevice.findOutputByName(deviceinfo.output):name() ~= hs.audiodevice.defaultOutputDevice():name() then
          hs.audiodevice.findOutputByName(deviceinfo.output):setDefaultOutputDevice()
          hs.audiodevice.findOutputByName(deviceinfo.output):setDefaultEffectDevice()
          hs.audiodevice.defaultOutputDevice():setOutputVolume(20)
          hs.audiodevice.defaultOutputDevice():setBalance(0.5)
        end

        hs.audiodevice.findInputByName(deviceinfo.input):setDefaultInputDevice()
        hs.audiodevice.findOutputByName(deviceinfo.output):setDefaultOutputDevice()
        hs.notify.show("Updated sound settings", "", deviceinfo.name .. " sound preset now in use.")
        return
      end
    end
  end
end

return obj
