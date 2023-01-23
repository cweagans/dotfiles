local overrides = require "custom.plugins.overrides"

return {
  -- Automatic cd to project root + session info.
  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require("project_nvim").setup({})
    end,
    requires = {
      "nvim-telescope/telescope.nvim",
    },
  },

  -- Show marks in signs column.
  ["chentoast/marks.nvim"] = {
    config = function()
      require('marks').setup({
        default_mappings = false,
      })
    end,
  },

  -- Get keymapping help.
  ["folke/which-key.nvim"] = {
    disable = false,
  },

  -- TODO: Remove this when upgrading to Neovim 0.9 (which has built-in editorconfig support).
  ["gpanders/editorconfig.nvim"] = {},

  -- Show LSP progress.
  ["j-hui/fidget.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("fidget").setup()
    end,
  },

  -- Formatting, linting, etc.
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- Per-directory config overrides if needed.
  ["klen/nvim-config-local"] = {
    event = "DirChanged",
    config = function()
      require('config-local').setup({
        config_files = {".vimrc.lua"},
        silent = true,
      })
    end,
  },

  -- Override.
  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = overrides.indentblankline,
  },

  -- Configure lsp.
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },

  -- Override.
  ["nvim-tree/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- Override.
  ["NvChad/ui"] = {
    override_options = overrides.nvchadui,
  },

  -- Override.
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  -- Override.
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

}
