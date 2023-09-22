return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "php",
        "phpdoc",
        "twig",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {},
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local nls = require("null-ls")
        vim.list_extend(opts.sources, {
          nls.builtins.diagnostics.phpcs,
          nls.builtins.diagnostics.phpmd,
          nls.builtins.diagnostics.phpstan,
          nls.builtins.formatting.phpcbf,
          nls.builtins.formatting.phpcsfixer,
        })
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, {
            "phpcs",
            "php-cs-fixer",
            "phpmd",
            "phpstan",
            "phpcbf",
            "php-debug-adapter",
          })
        end,
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "theutz/neotest-pest",
      "olimorris/neotest-phpunit",
    },
    opts = {
      adapters = {
        ["neotest-pest"] = {},
        ["neotest-phpunit"] = {},
      },
    },
  },
}
