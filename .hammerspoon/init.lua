
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

-- Slow quit (replaces CommandQ)
-- Taken from https://github.com/dbmrq/dotfiles/blob/master/home/.hammerspoon/slowq.lua
local killedIt = false
function pressedQ()
    killedIt = false
    hs.alert.show("CmdQ")
    hs.timer.usleep(1000000 * .1)
end
function repeatQ()
    if killedIt then return end
    hs.application.frontmostApplication():kill()
    killedIt = true
    hs.alert.closeAll()
end
hs.hotkey.bind('cmd', 'Q', pressedQ, nil, repeatQ)

-- Load, configure, and start Magneto.
m = hs.loadSpoon("Magneto")
m:start()

-- Load the other parts of my configuration.
require "sound"
