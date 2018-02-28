---
--- Sound handling
---

local dockInputName = "USB audio CODEC"
local dockOutputName = "USB audio CODEC"
local monitorInputName = "HD Pro Webcam C920"
-- Note that this is displayed as 34UM95 in Sound.prefpane.
local monitorOutputName = "DisplayPort"

-- Helper function to set audio i/o to the thunderbolt dock.
function useDockAudio()
	hs.audiodevice.findInputByName(dockInputName):setDefaultInputDevice()
	hs.audiodevice.findOutputByName(dockOutputName):setDefaultOutputDevice()
	hs.audiodevice.findOutputByName(dockOutputName):setOutputVolume(75)
end

-- Helper function to set audio i/o to the monitor + webcam.
function useMonitorAudio()
	hs.audiodevice.findOutputByName(monitorOutputName):setDefaultOutputDevice()
	hs.audiodevice.findInputByName(monitorInputName):setDefaultInputDevice()
end


-- Intelligent audio toggle.
hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'S', function()

	-- When connected to the dock, toggle between Thunderbolt and Monitor + Webcam.
	if (hs.audiodevice.findOutputByName(dockOutputName) ~= nil) then
		if (hs.audiodevice.defaultOutputDevice():name() == dockOutputName) then
			useMonitorAudio()
		else
			useDockAudio()
		end
	end

end)

-- Watch for dock connection.
function watchForDockChanges(eventType)
	-- If it's a device connection or disconnection, and USB audio CODEC is
	-- present afterwards, then the computer was just docked.
	if eventType == "dev#" and (hs.audiodevice.findOutputByName(dockOutputName) ~= nil) then
		useDockAudio()
	end
end
hs.audiodevice.watcher.setCallback(watchForDock)
hs.audiodevice.watcher.start()

-- When the system sleeps, mute all audio.
function watchForSleep(eventType)
	if eventType == hs.caffeinate.watcher.systemWillSleep then
		hs.audiodevice.defaultOutputDevice():setOutputMuted(true)

		-- If anything is playing in spotify, pause it before sleeping.
		if hs.spotify.isPlaying() then
			hs.spotify.pause()
		end
	end
end
local soundSleepWatcher = hs.caffeinate.watcher.new(watchForSleep)
soundSleepWatcher:start()
