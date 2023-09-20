return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local icons = require("lazyvim.config").icons
    opts.extensions = { "nvim-tree", "lazy", "trouble" }
    opts.theme = "nord"
    opts.sections = {
      lualine_a = {
        "mode",
      },
      lualine_b = {
        { "filetype", icon_only = true, colored = false, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1 },
      },
      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
      },
      lualine_x = {
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
        },
      },
      lualine_y = { "branch" },
      lualine_z = { "location" },
    }
  end,
}
