-- Override some options
local opts = {
  -- Don't show the tab line at the top of the window.
  showtabline = 0,

  -- Show a guide column at 80 characters.
  colorcolumn = "80",

  -- Keep 1000 entries in the command history
  history = 1000,

  -- Allow positioning the cursor one character after the end of a line.
  virtualedit = "onemore",

  -- Allow backspacing through indents, eol, and start of insert
  backspace = "indent,eol,start",

  -- Show problematic whitespace
  listchars = 'tab:→ ,trail:•,precedes:←,extends:→,nbsp:␣',

  -- Lines to scroll when the cursor leaves the screen
  scrolljump = 5,

  -- Minimum visible lines to keep above or below the cursor
  scrolloff = 3,

  -- GUIs should use a patched font so everything displays correctly.
  guifont = "SauceCodePro Nerd Font:h16",
}
for key, value in pairs(opts) do
  vim.opt[key] = value
end
