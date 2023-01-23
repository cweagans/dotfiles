-- GUI settings for Neovide.
if vim.g.neovide ~= nil then
  --- Turn down the animation length just a smidge.
  vim.g.neovide_cursor_animation_length = 0.04

  --- No point in running at a buttery smooth 60fps if the window isn't focused.
  vim.g.neovide_no_idle = false

  --- Window and titlebar color settings.
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.0
  vim.g.neovide_background_color = "#2E3440"

  -- Cmd key should work as expected in neovide.
  vim.g.neovide_input_use_logo = true
end


-- Set some options.
local opts = {
  --- Keep 10k commands in history.
  history = 10000,

  -- Allow positioning the cursor one character after the end of the line.
  virtualedit = "onemore",

  -- Allow backspacing through indents, EOL, and start of insert.
  backspace = "indent,eol,start",

  -- Show problematic whitespace.
  list = true,
  listchars = 'tab:→ ,trail:•,precedes:←,extends:→,nbsp:␣',

  -- Lines to scroll when the cursor leaves the screen.
  scrolljump = 5,

  -- Minimum visible lines to keep above or below the cursor.
  scrolloff = 3,
}

for key, value in pairs(opts) do
  vim.opt[key] = value
end
