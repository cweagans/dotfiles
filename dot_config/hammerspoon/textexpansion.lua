--[[
	*************

	Text Expander v0.1
	Based on: https://github.com/Hammerspoon/hammerspoon/issues/1042

	How to "install":
	- Simply copy and paste this code in your "init.lua".

	How to use:
	- Add your hotstrings (abbreviations that get expanded) to the "keywords" list following the example format.
	- Save and reload your HammerSpoon config. The text expansion feature will start automatically.

	Features:
	- Text expansion starts automatically in your init.lua config.
	- Hotstring expands immediately.
	- Word buffer is cleared after pressing one of the "navigational" keys.
	  PS: The default keys should give a good enough workflow so I didn't bother including other keys.
		  If you'd like to clear the buffer with more keys simply add them to the "navigational keys" conditional.

	Limitations:
	- Can't expand hotstring if it's immediately typed after an expansion. Meaning that typing "..name..name" will result in "My name..name".
	  This is intentional since the hotstring could be a part of the expanded string and this could cause a loop.
	  In that case you have to type one of the "buffer-clearing" keys that are included in the "navigational keys" conditional (which is very often the case).

	*************
--]]

keywords = {
  ["..shrug"] = "¯\\_(ツ)_/¯",
  ["..tableflip"] = "(╯°□°）╯︵ ┻━┻",
  ["..disapprove"] = "ಠ_ಠ",
  ["..lipsum"] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In lobortis fermentum molestie. Vestibulum congue auctor nisi, eu ultrices lectus facilisis eu. Nulla molestie ornare massa, sed malesuada urna consequat sed. Curabitur a nibh blandit felis imperdiet interdum. Vivamus eu malesuada purus. Suspendisse in lacus non quam sagittis porttitor. In hac habitasse platea dictumst. Nullam suscipit nulla non tellus interdum faucibus. Ut eget mauris mi. Nam rhoncus quis massa sit amet placerat. Donec sollicitudin enim nec ex rutrum, in ornare arcu venenatis. Praesent consequat enim ante, et ornare eros pellentesque ut.",
  ["..ip"] = function()
    status, body, headers = hs.http.get("https://icanhazip.com", nil)
    return string.gsub(body, "^%s*(.-)%s*$", "%1")
    --return body
  end,
  ["..unixtime"] = function()
    return tostring(os.time())
  end,
  ["..uuid"] = function()
    output, status, type, rc = hs.execute("uuidgen")
    return tostring(output)
  end,
}

expander = (function()
  local word = ""
  local keyMap = require("hs.keycodes").map
  local keyWatcher
  local DEBUG = false

  -- create an "event listener" function that will run whenever the event happens
  keyWatcher = hs.eventtap
    .new({ hs.eventtap.event.types.keyDown }, function(ev)
      local keyCode = ev:getKeyCode()
      local char = ev:getCharacters()

      -- if "delete" key is pressed
      if keyCode == keyMap["delete"] then
        if #word > 0 then
          -- remove the last char from a string with support to utf8 characters
          local t = {}
          for _, chars in utf8.codes(word) do
            table.insert(t, chars)
          end
          table.remove(t, #t)
          word = utf8.char(table.unpack(t))
          if DEBUG then
            print("Word after deleting:", word)
          end
        end
        return false -- pass the "delete" keystroke on to the application
      end

      -- append char to "word" buffer
      word = word .. char
      if DEBUG then
        print("Word after appending:", word)
      end

      -- if one of these "navigational" keys is pressed
      if
        keyCode == keyMap["return"]
        or keyCode == keyMap["space"]
        or keyCode == keyMap["up"]
        or keyCode == keyMap["down"]
        or keyCode == keyMap["left"]
        or keyCode == keyMap["right"]
      then
        word = "" -- clear the buffer
      end

      if DEBUG then
        print("Word to check if hotstring:", word)
      end

      -- finally, if "word" is a hotstring
      if keywords[word] then
        for i = 1, utf8.len(word), 1 do
          hs.eventtap.keyStroke({}, "delete", 0)
        end -- delete the abbreviation

        if type(keywords[word]) == "function" then
          hs.eventtap.keyStrokes(keywords[word]())
        else
          hs.eventtap.keyStrokes(keywords[word]) -- expand the word
        end
        word = "" -- clear the buffer
      end

      return false -- pass the event on to the application
    end)
    :start() -- start the eventtap

  -- return keyWatcher to assign this functionality to the "expander" variable to prevent garbage collection
  return keyWatcher
end)() -- this is a self-executing function because we want to start the text expander feature automatically in out init.lua
