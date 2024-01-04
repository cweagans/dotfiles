return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
      )
      vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
    end,
    opts = {
      flavour = "mocha",
      no_italic = true,
      integrations = {
        dashboard = true,
        flash = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        markdown = true,
        mason = true,
        mini = {
          enabled = true,
        },
        neotree = true,
        neogit = true,
        neotest = true,
        noice = true,
        cmp = true,
        dap = true,
        dap_ui = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        notify = true,
        semantic_tokens = true,
        treesitter_context = true,
        treesitter = true,
        telescope = {
          enabled = true,
        },
        lsp_trouble = true,
        illuminate = {
          enabled = true,
          lsp = true,
        },
        which_key = true,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
