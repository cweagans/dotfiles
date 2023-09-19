-- Allow backspacing through indents, eol, and start of insert.
vim.o.backspace = "indent,eol,start"

-- Show a guide column at 80 characters.
vim.o.colorcolumn = "80"

-- Keep more command history.
vim.o.history = 10000

-- Show problematic whitespace.
vim.o.listchars = 'tab:→ ,trail:•,precedes:←,extends:→,nbsp:␣'

-- Turn on line numbers by default.
vim.o.number = true

-- Lines to scroll when the cursor leaves the screen.
vim.o.scrolljump = 5

-- Minimum lines to keep above or below the cursor.
vim.o.scrolloff = 3

-- Don't show the tab line at the top of the window.
vim.o.showtabline = false

-- Allow positioning the cursor one character after the end of a line.
vim.o.virtualedit = "onemore"
