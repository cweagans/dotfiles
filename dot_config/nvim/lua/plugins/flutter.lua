return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "dart",
      })
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    enabled = (vim.fn.executable("flutter") == 1),
    requires = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    lazy = false,
    config = function()
      require("flutter-tools").setup({})
      require("telescope").load_extension("flutter")
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
      },
    },
  },
}
