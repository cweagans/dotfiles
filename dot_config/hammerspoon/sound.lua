-- These are ordered by priority. The first one found wins (top to bottom).
local presets = {
  {
    name = "Home Office (Headphones)",
    input = "Producer USB",
    output = "Soundcore Life Q20",
    detect = function()
      return (hs.audiodevice.findOutputByName("TX-384Khz Hifi Type-C Audio") ~= nil)
          and (hs.audiodevice.findOutputByName("Soundcore Life Q20") ~= nil)
    end,
  },
  {
    name = "Home Office (AirPods Max)",
    input = "Producer USB",
    output = "Cameron’s AirPods Max",
    detect = function()
      return (hs.audiodevice.findOutputByName("TX-384Khz Hifi Type-C Audio") ~= nil)
          and (hs.audiodevice.findOutputByName("Cameron’s AirPods Max") ~= nil)
    end,
  },
  {
    name = "Home Office",
    input = "Producer USB",
    output = "TX-384Khz Hifi Type-C Audio",
    detect = function()
      return (hs.audiodevice.findOutputByName("TX-384Khz Hifi Type-C Audio") ~= nil)
    end,
  },
  {
    name = "Mobile (Headphones)",
    input = "MacBook Pro Microphone",
    output = "Soundcore Life Q20",
    detect = function()
      return (hs.audiodevice.findOutputByName("Soundcore Life Q20") ~= nil)
    end,
  },
  {
    name = "Mobile (AirPods Max)",
    input = "MacBook Pro Microphone",
    output = "Cameron’s AirPods Max",
    detect = function()
      return (hs.audiodevice.findOutputByName("Cameron’s AirPods Max") ~= nil)
    end,
  },
  {
    name = "Built-in hardware",
    input = "MacBook Pro Microphone",
    output = "MacBook Pro Speakers",
    detect = function()
      return true
    end,
  },
}

function handleWakeFromSleep(event)
  if eventtype ~= hs.caffeinate.watcher.systemDidWake then
    return
  end

  detectAudio()
end

function detectAudio()
  for i, deviceinfo in ipairs(presets) do
    if deviceinfo.detect() then
      switchToPreset(deviceinfo)
      return
    end
  end
end

function switchToPreset(deviceinfo)
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
  hs.notify.show("Updated sound settings", "", deviceinfo.name .. " sound preset now in use.")
end

-- When the machine wakes from sleep, detect audio settings.
local sleepWatcher = hs.caffeinate.watcher.new(handleWakeFromSleep)
sleepWatcher:start()

function AlfredDetectAudioPreset()
  detectAudio()
end

function AlfredSwitchToPreset(presetName)
  for i, deviceinfo in ipairs(presets) do
    if deviceinfo.name == presetName then
      switchToPreset(deviceinfo)
      return
    end
  end
end
