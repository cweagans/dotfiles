
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

-- Load, configure, and start HammerText.
ht = hs.loadSpoon("HammerText")
ht.keywords = {
    ["..zl"] = "https://www.digitaldeployment.com/cameron/zoom",
    ["..zi"] = [[Cameron Eagans is inviting you to a scheduled Zoom meeting.

    Topic: Cameron Eagans' Personal Meeting Room
    
    Join Zoom Meeting
    https://zoom.us/j/9162381804
    
    Meeting ID: 916 238 1804
    
    One tap mobile
    +16699006833,,9162381804# US (San Jose)
    +16465588656,,9162381804# US (New York)
    
    Dial by your location
            +1 669 900 6833 US (San Jose)
            +1 646 558 8656 US (New York)
    Meeting ID: 916 238 1804
    Find your local number: https://zoom.us/u/abaDHdWvft]],
}
ht:start()

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

-- Ctrl + Alt + Command + Shift + V resizes the frontmost window to 1920x1020.
hs.hotkey.bind({"ctrl", "alt", "command", "shift"}, "v", function()
    -- Get the frontmost app.
    local app = hs.application.frontmostApplication()

    -- Set the position of the window to y = 0 to ensure that it resizes properly.
    app:mainWindow():setTopLeft(hs.geometry.new({x = 0, y = 0}))

    -- Set the exact size needed for a code stream
    app:mainWindow():setSize(hs.geometry.new("1920x1080"))

    -- Remind me to set the window capture source before going live.
    hs.alert.show("When OBS loads, set the Window Source to the window you want to stream (both app scenes if needed).", hs.screen.mainScreen(), 5)
end)
