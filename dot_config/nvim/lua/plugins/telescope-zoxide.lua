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
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local zoxide = {
        action = "Telescope zoxide list",
        desc = " Jump to directory",
        icon = "",
        key = "z",
      }

      zoxide.desc = zoxide.desc .. string.rep(" ", 43 - #zoxide.desc)
      zoxide.key_format = "  %s"

      table.insert(opts.config.center, 3, zoxide)
    end,
  },
}
