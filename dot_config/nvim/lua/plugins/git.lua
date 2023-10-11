return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "commitlint",
        "gitlint",
      })
    end,
  },
}
