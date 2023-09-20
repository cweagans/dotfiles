-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Home/End should go to the beginning/end of a buffer instead of a line.
vim.keymap.set("n", "<Home>", "gg")
vim.keymap.set("n", "<End>", "G")

-- Clear searches on ESC.
vim.keymap.set("n", "<Esc>", '<cmd>let @/ = ""<cr><esc>')

-- Better goto mark mapping.
vim.keymap.set("n", "gm", "g'")
