local opts = {
  -- Show a guide column at 80 and 120 characters.
  colorcolumn = {"80", "120"},

  --- Keep 10k commands in history.
  history = 10000,

  -- Allow positioning the cursor one character after the end of the line.
  virtualedit = "onemore",

  -- Allow backspacing through indents, EOL, and start of insert.
  backspace = "indent,eol,start",

  -- Show problematic whitespace.
  listchars = 'tab:→ ,trail:•,precedes:←,extends:→,nbsp:␣',

  -- Lines to scroll when the cursor leaves the screen.
  scrolljump = 5,

  -- Minimum visible lines to keep above or below the cursor.
  scrolloff = 3,
}

for key, value in pairs(opts) do
  vim.opt[key] = value
end
