-- Set leader to ,
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Install package manager.
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Register plugins.
require('lazy').setup({
	{ import = 'cweagans.plugins' }
}, {})

