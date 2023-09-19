-- Allow backspacing through indents, eol, and start of insert.
vim.o.backspace = "indent,eol,start"

-- Highlight the current line.
vim.o.cursorline = true

-- Spaces instead of tabs. Fight me.
vim.o.expandtab = true

-- Keep more command history.
vim.o.history = 10000

-- Use a global statusline.
vim.o.laststatus = 3

-- Show invisible characters (configured in vim.o.listchars).
vim.o.list = true

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

-- Always show the sign column.
vim.o.signcolumn = "yes"

-- Put new split windows below the current one.
vim.o.splitbelow = true

-- Put new vsplit windows to the right of the current one.
vim.o.splitright = true

-- Allow positioning the cursor one character after the end of a line.
vim.o.virtualedit = "onemore"
