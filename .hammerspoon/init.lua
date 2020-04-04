
-- Install and load Spoons
hs.loadSpoon("SpoonInstall")
spoon.use_syncinstall = true
spoon.SpoonInstall:andUse("ReloadConfiguration")
spoon.SpoonInstall:andUse("Caffeine")
spoon.SpoonInstall:andUse("HoldToQuit")

-- Automatically reload configuration when it changes.
spoon.ReloadConfiguration:start()

-- Caffeinate toggle in menu bar.
spoon.Caffeine:start()

-- Start HoldToQuit
spoon.HoldToQuit:start()

-- Add a screen lock shortcut.
hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'L', function()
    hs.caffeinate.lockScreen()
end)

-- Load, configure, and start Magneto.
m = hs.loadSpoon("Magneto")
m:start()

-- Ctrl + Space should toggle kitty (terminal) visibility.
hs.hotkey.bind({"ctrl"}, "space", function()
    local app = hs.application.get("kitty")
    if app then
        if not app:mainWindow() then
            app:selectMenuItem({"kitty", "New OS window"})
        elseif app:isFrontmost() then
            app:hide()
        else
            app:activate()
        end
    else
        hs.application.launchOrFocus("kitty")
    end
end)

