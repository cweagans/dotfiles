-- Unset some lunarvim keybindings
lvim.keys.insert_mode["jk"] = false
lvim.keys.insert_mode["jj"] = false
lvim.keys.insert_mode["kj"] = false
lvim.keys.normal_mode["<C-Up>"] = false
lvim.keys.normal_mode["<C-Down>"] = false
lvim.keys.normal_mode["<C-Left>"] = false
lvim.keys.normal_mode["<C-Right>"] = false

-- Resize windows
lvim.keys.normal_mode["<C-s>"] = ":resize -2<cr>"
lvim.keys.normal_mode["<C-t>"] = ":resize +2<cr>"
lvim.keys.normal_mode["<C-n>"] = ":vertical resize -2<cr>"
lvim.keys.normal_mode["<C-w>"] = ":vertical resize +2<cr>"

-- Scrolling
lvim.keys.normal_mode["<C-S-j>"] = "10<C-e>"
lvim.keys.normal_mode["<C-S-k>"] = "10<C-y>"

-- Yank from the cursor to the end of the line to be consistent with C and D
lvim.keys.normal_mode["Y"] = 'y$'

-- Disable ex mode
lvim.keys.normal_mode["Q"] = false

-- For wrapped lines, j and k should navigate between rows rather than lines.
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["k"] = "gk"

-- Home and End should go to the beginning and end of a buffer rather than a line.
lvim.keys.normal_mode["<Home>"] = "gg"
lvim.keys.normal_mode["<End>"] = "G"

-- Clear searches on ESC
lvim.keys.normal_mode["<Esc>"] = '<cmd>let @/ = ""<cr><esc>'

-- Better goto mark mapping
lvim.keys.normal_mode["gm"] = "g'"
