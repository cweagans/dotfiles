-- If PHP is not installed, don't add anything to the installation.
if vim.fn.executable("php") ~= 1 then
  return {}
end

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
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        php = { "php_cs_fixer", "phpcbf" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        gdscript = { "php", "phpcs", "phpmd", "phpstan" },
      },
    },
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
