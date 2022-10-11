---
--- Sound handling
---

--- @todo: check if computer is docked when coming up from sleep or periodically maybe?

local dockInputName = "Producer USB"
local dockOutputName = "TX-384Khz Hifi Type-C Audio"

-- Helper function to configure audio IO with my Thunderbolt dock at home.
function setupDockAudio()
	hs.audiodevice.findInputByName(dockInputName):setDefaultInputDevice()
	hs.audiodevice.findOutputByName(dockOutputName):setDefaultOutputDevice()
	hs.audiodevice.findOutputByName(dockOutputName):setDefaultEffectDevice()
	hs.audiodevice.findOutputByName(dockOutputName):setOutputVolume(20)
	hs.audiodevice.findOutputByName(dockOutputName):setBalance(0.5)
end

-- Intelligent audio toggle.
hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'S', function()
	-- If I'm connected to my home dock, then reset all settings to something decent.
	if (hs.audiodevice.findOutputByName(dockOutputName) ~= nil) then
		setupDockAudio()
		hs.notify.show('Dock sound reset', '', 'Default dock audio settings are now in use')
	end
end)

-- Watch for dock connection.
function watchForDockChanges(eventType)
	-- If it's a device connection or disconnection, and the dock audio device
	-- present afterwards, then the computer was just docked.
	if eventType == "dev#" and (hs.audiodevice.findOutputByName(dockOutputName) ~= nil) then
		setupDockAudio()
	end
end
hs.audiodevice.watcher.setCallback(watchForDockChanges)
hs.audiodevice.watcher.start()

-- When the system sleeps, mute all audio.
function watchForSleep(eventType)
	if eventType == hs.caffeinate.watcher.systemWillSleep then
		hs.audiodevice.defaultOutputDevice():setOutputMuted(true)

		-- If anything is playing in spotify, pause it before sleeping.
		if hs.spotify.isPlaying() then
			hs.spotify.pause()
		end

		-- If anything is playing in iTunes/Apple Music, pause it too.
		if hs.itunes.isPlaying() then
			hs.itunes.pause()
		end
	end
end
local soundSleepWatcher = hs.caffeinate.watcher.new(watchForSleep)
soundSleepWatcher:start()
