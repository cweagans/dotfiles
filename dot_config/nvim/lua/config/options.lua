-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Turn off relative line numbers.
vim.o.relativenumber = false

-- Set a color column.
vim.o.colorcolumn = "80,120"

-- Show maching brackets/parens.
vim.o.showmatch = true

-- Set split behavior.
vim.o.splitright = true --vsplit opens to the right
vim.o.splitbelow = true --split opens below

-- *.Jenkinsfile should also be groovy.
-- TODO: Report this upstream.
vim.filetype.add({
  extension = {
    Jenkinsfile = "groovy",
  },
})
