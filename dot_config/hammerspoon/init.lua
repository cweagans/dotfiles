require("console")

-- TODO: This makes reloading config take forever. Figure out why and/or only run it when necessary.
-- hs.loadSpoon("EmmyLua")

-- Enable IPC so that the Hammerspoon CLI will work.
require("hs.ipc")

require("textexpansion")
require("windowmanagement")
require("hbar")
require("urls")
require("bear")
require("sealconfig")

-- Screen lock
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "L", function()
  hs.caffeinate.lockScreen()
end)

-- Automatically reload configuration on change.
function reloadConfig(files)
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      hs.reload()
      return
    end
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.config/hammerspoon", reloadConfig):start()
