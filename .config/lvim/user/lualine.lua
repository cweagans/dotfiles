local table = require("table")

-- The default lualine colors are fine for the Nordic theme.
lvim.builtin.lualine.options.theme = "nord"

-- Enable the nvim-tree extension.
lvim.builtin.lualine.extensions = { "nvim-tree" }

-- Disable lualine in alpha buffers (the other two are defaults from lvim)
lvim.builtin.lualine.options.disabled_filetypes = { "alpha", "NvimTree", "Outline" }

-- Set up a custom layout.
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.sections.lualine_a = {
  {
    "mode",
    fmt = function()
      return " "
    end,
    padding = { left = 0, right = 0 },
    separator = { left = "", right = "" }
  },
}
lvim.builtin.lualine.sections.lualine_b = { "filename" }
lvim.builtin.lualine.sections.lualine_c = { "branch", "diff", "diagnostics" }
lvim.builtin.lualine.sections.lualine_x = {
  {
    "lsp_progress",
    display_components = { 'spinner', { 'percentage', 'message' }, 'lsp_client_name'},
    colors = {
      percentage = "#8fbcbb",
      lsp_client_name = "#81a1c1",
      use = true,
    },
    separators = {
      lsp_client_name = { pre = "", post = "" },
      message = { commenced = 'In Progress', completed = 'Done' },
    },
    timer = { spinner = 10 },
    spinner_symbols = { '⠋ ', '⠙ ', '⠹ ', '⠸ ', '⠼ ', '⠴ ', '⠦ ', '⠧ ', '⠇ ', '⠏ ' },
  },
}
lvim.builtin.lualine.sections.lualine_y = { "filetype" }
lvim.builtin.lualine.sections.lualine_z = { "location" }

