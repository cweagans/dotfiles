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
	{
		'shaunsingh/nord.nvim',
		priority = 1000,
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = true
			vim.g.nord_italic = false
			require('nord').set()
		end,
	},

	{ import = 'cweagans.plugins' }
}, {})

require('cweagans.options')
