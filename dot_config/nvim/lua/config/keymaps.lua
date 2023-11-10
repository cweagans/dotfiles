-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Home/End should go to the beginning/end of a buffer instead of a line.
vim.keymap.set("n", "<Home>", "gg")
vim.keymap.set("n", "<End>", "G")

-- Clear searches on ESC.
vim.keymap.set("n", "<Esc>", '<cmd>let @/ = ""<cr><esc>')

-- Better goto mark mapping.
vim.keymap.set("n", "gm", "g'")

-- Visual shifting (does not exit visual mode).
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- For when you forget to sudo. *Really* write the file.
vim.keymap.set("c", "w!!", "w !sudo tee % >/dev/null")

-- Resize windows
vim.keymap.set("n", "<C-s>", ":resize -2<cr>", { silent = true })
vim.keymap.set("n", "<C-t>", ":resize +2<cr>", { silent = true })
vim.keymap.set("n", "<C-n>", ":vertical resize -2<cr>", { silent = true })
vim.keymap.set("n", "<C-w>", ":vertical resize +2<cr>", { silent = true })

-- Disable lazyvim and add mapping for Neogit.
vim.keymap.del("n", "<Leader>gG")
vim.keymap.set("n", "<Leader>gg", "<cmd>Neogit<cr>")

-- Move Lazy keymap to L instead of l
vim.keymap.del("n", "<Leader>L")
vim.keymap.del("n", "<Leader>l")
vim.keymap.set("n", "<Leader>L", "<cmd>Lazy<cr>")
