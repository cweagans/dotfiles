local deskInput = "Producer USB"
local deskOutput = "TX-384Khz Hifi Type-C Audio"
local mobileInput = "MacBook Pro Microphone"
local mobileOutput = "Macbook Pro Speakers"

function handleWakeFromSleep(event)
  if eventtype ~= hs.caffeinate.watcher.systemDidWake then
    return
  end

  local i = mobileInput
  local o = mobileOutput
  if hs.audiodevice.findOutputByName(deskOutput) then
    i = deskInput
    o = deskOutput
  end

  if hs.audiodevice.findOutputByName(o):name() ~= hs.audiodevice.defaultOutputDevice():name() then
    hs.audiodevice.findOutputByName(o):setDefaultOutputDevice()
    hs.audiodevice.findOutputByName(o):setDefaultEffectDevice()
    hs.audiodevice.defaultOutputDevice():setOutputVolume(20)
    hs.audiodevice.defaultOutputDevice():setBalance(0.5)
  end

  hs.audiodevice.findInputByName(i):setDefaultInputDevice()
  hs.audiodevice.findOutputByName(i):setDefaultOutputDevice()
  hs.notify.show("Updated sound settings.")
end

--- When the machine wakes from sleep, detect audio settings.
local sleepWatcher = hs.caffeinate.watcher.new(handleWakeFromSleep)
sleepWatcher:start()
