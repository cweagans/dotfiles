return {
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    opts = {
      overrides = function(colors)
        return {
          NeogitDiffAdd = { fg = colors.green, bg = colors.bg },
          NeogitDiffAddHighlight = { fg = colors.green, bg = colors.bg },
          NeogitDiffDelete = { fg = colors.red, bg = colors.bg },
          NeogitDiffDeleteHighlight = { fg = colors.red, bg = colors.bg },
          NeogitDiffContext = { fg = colors.fg, bg = colors.bg },
          NeogitDiffContexxtHighlight = { fg = colors.fg, bg = colors.bg },
        }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
