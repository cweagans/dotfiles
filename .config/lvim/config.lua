-- TODO:
-- * Plugins to try
--    * dial.nvim: https://github.com/monaqa/dial.nvim
--    * neovim remote: https://github.com/mhinz/neovim-remote
--    * nvim-lightbuilb: https://github.com/kosayoda/nvim-lightbulb
--    * lspsaga: https://github.com/tami5/lspsaga.nvim
--    * octo.nvim: https://github.com/pwntester/octo.nvim
--    * mini.nvim: https://github.com/echasnovski/mini.nvim
--    * gitlinker.nvim: https://github.com/ruifm/gitlinker.nvim
--    * diffview.nvim: https://github.com/sindrets/diffview.nvim
--    * fidget.nvim: https://github.com/j-hui/fidget.nvim
-- * Config
--    * Consider adding neogit (which is like magit for neovim)
--    * Add ansible-related null ls config
--      * ansible-lint is installed
--    * Get full DAP support working for PHP and Go and Tinygo
--      * Plugins are already installed
--    * Enable other framework-specific stubs
--      * Wordpress
--      * Laravel
--    * Decide if I want to set up any gamedev things
--      * godot integration: https://www.reddit.com/r/neovim/comments/oiani5/need_help_setting_up_native_lsp_for_godot/
--      * godot integration: https://github.com/habamax/vim-godot
--    * Build a telescope plugin to configure a project for Tinygo
--    * Rewrite asyncdo.vim and asynctasks.vim in Lua and allow Telescope-style third party registration of tasks
--      * Want to support Makefile, Taskfile, composer, npm, etc. AND any externally defined task discovery things
--      * Also support language-standard things (e.g. go build/run/etc)
--    * Full flutter support
--      * Add flutter keybinds to Which Key when in a flutter project
--      * Add code actions UI for automatic fixes
-- * Upstream
--    * Add full PHP support to Lunarvim
--    * Make it possible to disable/upgrade any plugin
--      * Lunarvim reload (,Lr) causes barbar to come back for some reason
--    * Make it possible to override LSP configuration without taking over the entire setup process (ie. just override one param)

-- Include some other configs
require('user.alpha')
require('user.disable_builtins')
require('user.gui')
require('user.keymap')
require('user.lualine')
require('user.null_ls')
require('user.options')
require('user.project_type')
require('user.toggleterm')
require('user.trouble')

-- Set the leader to comma
lvim.leader = ","

-- Add some plugins
lvim.plugins = {
  {"goolord/alpha-nvim"},
  {"gpanders/editorconfig.nvim"},
  {"arkav/lualine-lsp-progress"},
  {"andersevenrud/nordic.nvim"},
  {"folke/trouble.nvim"},
  {"~/.config/lvim/plugins/telescope-task.nvim"},
  {"akinsho/flutter-tools.nvim"},
  {"ray-x/go.nvim"},
  {"rcarriga/nvim-dap-ui"},
  {"theHamsta/nvim-dap-virtual-text"},
  {
    "chentau/marks.nvim",
    config = function()
      require('marks').setup({
        default_mappings = false,
      })
    end
  },
  {
    "klen/nvim-config-local",
    config = function()
      require('config-local').setup {
        config_files = { ".vimrc.lua", ".vim/local.lua" },
        silent = true,
      }
    end
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  },
  {
    "lukas-reineke/virt-column.nvim",
    config = function()
      require("virt-column").setup()
    end
  }
}

-- Set the colorscheme to nordic in lvim as well.
lvim.colorscheme = "nordic"
vim.g.nord_italic = false

-- Disable the bufferline
lvim.builtin.bufferline.active = false

-- Disable the dashboard (the plugin isn't installed by default anyway)
lvim.builtin.dashboard.active = false

-- Enable debugging
lvim.builtin.dap.active = true

-- Enable toggleterm
lvim.builtin.terminal.active = true

-- Open nvim-tree on the right side of the screen
lvim.builtin.nvimtree.setup.view.side = "right"

-- Position the cursor at the beginning of any given line in the tree
lvim.builtin.nvimtree.setup.hijack_cursor = true

-- When a file is selected in the tree, close the tree
lvim.builtin.nvimtree.quit_on_open = 1

-- Make the file tree wider by default.
lvim.builtin.nvimtree.setup.view.width = 50

-- Do NOT ignore gitignored files. It's important to be able to see all files
-- in a project in the file tree.
lvim.builtin.nvimtree.setup.git.ignore = false

-- Use alpha instead of Dashboard.nvim
lvim.builtin.which_key.mappings[";"] = { "<cmd>Alpha<CR>", "Dashboard"}

-- Enable the treesitter autotag extension
lvim.builtin.treesitter.autotag.enable = true

-- Disable treesitter which_key config (replacing with trouble keybinds)
lvim.builtin.which_key.mappings["h"] = nil
lvim.builtin.which_key.mappings["T"] = lvim.builtin.which_key.mappings["t"]

-- Set up terminal keybinds
lvim.builtin.which_key.mappings["t"] = {
  name = "Terminal",
  t = { "<cmd>ToggleTerm<cr>", "Terminal" },
}

-- Custom buffer switching shortcuts
lvim.builtin.which_key.mappings["b"]["b"] = nil
lvim.builtin.which_key.mappings["b"]["c"] = { "<cmd>BufferWipeout<cr>", "Close buffer"}
lvim.builtin.which_key.mappings["b"]["f"] = nil
lvim.builtin.which_key.mappings["b"]["h"] = nil
lvim.builtin.which_key.mappings["b"]["j"] = nil
lvim.builtin.which_key.mappings["b"]["l"] = nil
lvim.builtin.which_key.mappings["b"]["n"] = { "<cmd>bnext<cr>", "Next buffer" }
lvim.builtin.which_key.mappings["b"]["p"] = { "<cmd>bprevious<cr>", "Previous buffer" }
lvim.builtin.which_key.mappings["b"]["s"] = { "<cmd>Telescope buffers<cr>", "Switch buffers" }
lvim.builtin.which_key.mappings["b"]["w"] = nil
lvim.builtin.which_key.mappings["b"]["D"] = nil
lvim.builtin.which_key.mappings["b"]["L"] = nil

-- Search marks
lvim.builtin.which_key.mappings["s"]["m"] = { "<cmd>Telescope marks<cr>", "Marks" }
lvim.builtin.which_key.mappings["m"] = {
  name = "Marks",
  d = { "<cmd>echo 'Which mark? ' | lua require('marks').delete()<cr>", "Delete mark" },
  m = { "<cmd>echo 'Which mark? ' | lua require('marks').set()<cr>", "Set mark" },
  s = { "<cmd>Telescope marks<cr>", "Search marks" },
  t = { "<cmd>lua require('marks').toggle()<cr>", "Toggle mark"},
  D = { "<cmd>lua require('marks').delete_line()<cr>", "Delete all line marks" },
  B = { "<cmd>lua require('marks').delete_buf()<cr>", "Delete all buffer marks" },
}

-- Set up a which-key mapping for restoring a session with persistence.nvim
lvim.builtin.which_key.mappings["S"] = { "<cmd>lua require('persistence').load({ last = true })<CR>", "Load previous session" }

-- Turn off lunarvim autoconfig of dartls. Flutter tools plugin handles this.
vim.list_extend(lvim.lsp.override, { "dartls" })

-- Enable treesitter parser for hcl to run on terraform files too.
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.hcl = {
  filetype = "hcl", "terraform",
}

