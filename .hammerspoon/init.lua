
-- Install and load Spoons
hs.loadSpoon("SpoonInstall")
spoon.use_syncinstall = true
spoon.SpoonInstall:andUse("ReloadConfiguration")
spoon.SpoonInstall:andUse("Caffeine")

-- Automatically reload configuration when it changes.
spoon.ReloadConfiguration:start()

-- Caffeinate toggle in menu bar.
spoon.Caffeine:start()

-- Add a screen lock shortcut.
hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'L', function()
    hs.caffeinate.lockScreen()
end)

-- Load, configure, and start HammerText.
ht = hs.loadSpoon("HammerText")
ht.keywords = {
    ["..name"] = "My name",
    ["..addr"] = "My address",
}
ht:start()

-- Load the other parts of my configuration.
require "sound"
