-- These are ordered by priority. The first one found wins (top to bottom).
local presets = {
	{
		name = "Home Office",
		input = "Producer USB",
		output = "TX-384Khz Hifi Type-C Audio",
		detect = function()
			return (hs.audiodevice.findOutputByName('TX-384Khz Hifi Type-C Audio') ~= nil)
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

function handleDeviceConnectDisconnect(event)
	-- Only device connect/disconnect is of interest so that manual device changes are possible.
	if event ~= "dev#" then
		return
	end
	
	detectAudio()
end

function handleWakeFromSleep(event)
	if eventtype ~= hs.caffeinate.watcher.systemDidWake then
		return
	end
	
	detectAudio()
end

function detectAudio()
	for i, deviceinfo in ipairs(presets) do
		if deviceinfo.detect() then
			hs.notify.show("Updated sound settings", "", deviceinfo.name .. ' sound preset now in use.')
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
			return
		end
	end
end

-- Any time audio devices are connected/disconnected, detect audio settings.
hs.audiodevice.watcher.setCallback(handleDeviceConnectDisconnect)
hs.audiodevice.watcher.start()

-- When the machine wakes from sleep, detect audio settings.
local sleepWatcher = hs.caffeinate.watcher.new(handleWakeFromSleep)
sleepWatcher:start()

-- Finally, detect audio settings once when Hammerspoon starts.
detectAudio()

-- Toggle mic state.
function toggleInputMute()
	return function()
		if hs.audiodevice.defaultInputDevice():inputMuted() == true or hs.audiodevice.defaultInputDevice():inputVolume() == 0 then
			hs.audiodevice.defaultInputDevice():setInputMuted(false)
			hs.audiodevice.defaultInputDevice():setInputVolume(100)
			hs.alert.show("Input unmuted")
		else
			hs.audiodevice.defaultInputDevice():setInputMuted(true)
			hs.audiodevice.defaultInputDevice():setInputVolume(0)
			hs.alert.show("Input muted")
		end
	end
end
hs.hotkey.bind({"cmd", "shift"}, "a", toggleInputMute())