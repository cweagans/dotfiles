return {
  {
    "jvgrootveld/telescope-zoxide",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      extensions = {
        zoxide = {
          mappings = {
            default = {
              action = function(selection)
                vim.cmd.tcd(selection.path)
              end,
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("zoxide")
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>Z"] = { "<cmd>Telescope zoxide list<cr>", "Zoxide jump" },
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },
}
