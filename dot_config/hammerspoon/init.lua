require "sound"
require "windowmanagement"
require "textexpansion"

-- Screen lock
hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'L', function()
	hs.caffeinate.lockScreen()
end)

-- Automatically reload configuration on change.
function reloadConfig(files)
	for _, file in pairs(files) do
		if file:sub(-4) == '.lua' then
			hs.reload()
			return
		end
	end
end
hs.pathwatcher.new(os.getenv('HOME') .. '/.config/hammerspoon', reloadConfig):start()
