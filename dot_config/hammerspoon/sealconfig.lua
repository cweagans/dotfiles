hs.loadSpoon("Seal")
spoon.Seal:loadPlugins({
  "apps",
  "calc",
  "pasteboard",
  "safari_bookmarks",
  "sound",
  "useractions",
})
spoon.Seal.plugins.safari_bookmarks.always_open_with_safari = false
spoon.Seal.plugins.apps.appSearchPaths = {
  "/Applications",
  "/System/Applications",
  "~/Applications",
  "/Applications/Xcode.app/Contents/Applications",
  "/System/Library/PreferencePanes",
  "/Library/PreferencePanes",
  "~/Library/PreferencePanes",
  "/Library/Scripts",
  "~/Library/Scripts",
}
spoon.Seal.plugins.useractions.actions = {
  ["HTTP status codes"] = {
    url = "https://httpstatus.es/${query}",
    icon = "favicon",
    keyword = "http",
  },
  ["TLDR pages"] = {
    url = "https://tldr.inbrowser.app/pages/common/${query}",
    icon = "favicon",
    keyword = "tldr",
  },
  ["Toggle pasteboard history recording"] = {
    keyword = "pbt",
    fn = function()
      spoon.Seal.plugins.pasteboard.saveHistory = not spoon.Seal.plugins.pasteboard.saveHistory
      hs.notify
        .new({
          title = "Seal",
          informativeText = "Pasteboard history recording is now "
            .. (spoon.Seal.plugins.pasteboard.saveHistory and "on" or "off")
            .. ".",
        })
        :send()
    end,
  },
}

spoon.Seal:refreshAllCommands()
spoon.Seal:start()

-- Screen lock
hs.hotkey.bind({ "cmd" }, "space", function()
  spoon.Seal:toggle()
end)
