
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

-- Ctrl + Space should toggle kitty (terminal) visibility.
hs.hotkey.bind({"ctrl"}, "space", function()
    local app = hs.application.get("iTerm2")
    if app then
        if not app:mainWindow() then
            app:selectMenuItem({"iTerm2", "New OS window"})
        elseif app:isFrontmost() then
            app:hide()
        else
            app:activate()
        end
    else
        hs.application.launchOrFocus("iTerm2")
    end
end)

-- Ctrl + Alt + D, F, G should position a window half left, full screen, or half
-- right for streaming. All coordinates are for my 32:9 monitor and YMMV.
-- Ctrl + Alt + E, T should be offscreen left or right respectively.
hs.hotkey.bind({"ctrl", "alt"}, "d", function()
    moveWindow("streamLeft")
end)
hs.hotkey.bind({"ctrl", "alt"}, "f", function()
    moveWindow("streamFull")
end)
hs.hotkey.bind({"ctrl", "alt"}, "g", function()
    moveWindow("streamRight")
end)
hs.hotkey.bind({"ctrl", "alt"}, "e", function()
    moveWindow("offscreenLeft")
end)
hs.hotkey.bind({"ctrl", "alt"}, "t", function()
    moveWindow("offscreenRight")
end)
hs.hotkey.bind({"ctrl", "alt"}, "c", function()
    moveWindow("halfLeft")
end)
hs.hotkey.bind({"ctrl", "alt"}, "b", function()
    moveWindow("halfRight")
end)


function moveWindow(position)
    -- Get the current window as long as it's standard.
    local currentWindow = hs.window.focusedWindow()
    if not currentWindow:isStandard() then
        hs.logger.i("Cannot manipulate current window")
        return nil
    end

    newRect = {}
    newRect.y = 23    -- accounts for macOS menu bar. I always have it displaying.

    if position == "streamLeft" then
        newRect.x = 1280
        newRect.w = 1280
        newRect.h = 1920
    elseif position == "streamFull" then
        newRect.x = 1280
        newRect.w = 2560
        newRect.h = 1920
    elseif position == "streamRight" then
        newRect.x = 2560
        newRect.w = 1280
        newRect.h = 1920
    elseif position == "offscreenLeft" then
        newRect.x = 0
        newRect.w = 1280
        newRect.h = 1920
    elseif position == "offscreenRight" then
        newRect.x = 3840
        newRect.w = 1280
        newRect.h = 1920
    elseif position == "halfLeft" then
        newRect.x = 0
        newRect.w = 2560
        newRect.h = 1920
    elseif position == "halfRight" then
        newRect.x = 2560
        newRect.w = 2560
        newRect.h = 1920
    end

    currentWindow:setFrame(newRect, 0)

end

-- Load other configuration.
require "sound"
require "mail"
