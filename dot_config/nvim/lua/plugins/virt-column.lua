return {
  "lukas-reineke/virt-column.nvim",
  opts = {
    exclude = {
      buftypes = {
        "terminal",
        "nofile",
        "quickfix",
        "prompt",
      },
      filetypes = {
        "lspinfo",
        "checkhealth",
        "help",
        "man",
        "gitcommit",
        "TelescopePrompt",
        "TelescopeResults",
        "alpha",
      },
    },
  },
}
