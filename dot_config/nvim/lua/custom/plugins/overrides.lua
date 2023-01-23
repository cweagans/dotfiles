local M = {}

M.indentblankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
    "",
  }
}

M.mason = {
  ensure_installed = {
    -- LSP
    "ansible-language-server",
    "arduino-language-server",
    "bash-language-server",
    "css-lsp",
    "clangd",
    "dockerfile-language-server",
    "gopls",
    "html-lsp",
    "intelephense",
    "jq-lsp",
    "json-lsp",
    "lua-language-server",
    "openscad-lsp",
    "python-lsp-server",
    "sqls",
    "svelte-language-server",
    "tailwindcss-language-server",
    "terraform-ls",
    "vim-language-server",
    "vue-language-server",
    "yaml-language-server",

    -- DAP
    "bash-debug-adapter",
    "dart-debug-adapter",
    "debugpy",
    "delve",
    "js-debug-adapter",
    "php-debug-adapter",

    -- Linters and formatters
    "actionlint",
    "alex",
    "black",
    "blade-formatter",
    "codespell",
    "commitlint",
    "editorconfig-checker",
    "gitlint",
    "goimports",
    "golangci-lint",
    "golines",
    "jq",
    "jsonlint",
    "php-cs-fixer",
    "phpcs",
    "phpstan",
    "prettier",
    "proselint",
    "protolint",
    "ruff",
    "shellcheck",
    "shellharden",
    "sql-formatter",
    "sqlfluff",
    "stylua",
    "twigcs",
    "vale",
    "write-good",
    "yamllint",
  }
}

M.nvchadui = {
  tabufline = {
    enabled = false,
  }
}

M.nvimtree = {
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  extensions_list = { "themes", "terms", "projects" },
}

M.treesitter = {
  ensure_installed = {
    "arduino",
    "bash",
    "c",
    "cpp",
    "css",
    "d",
    "dart",
    "diff",
    "dockerfile",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "hcl",
    "html",
    "http",
    "ini",
    "javascript",
    "jq",
    "json",
    "json5",
    "jsonc",
    "lua",
    "make",
    "markdown",
    "mermaid",
    "php",
    "phpdoc",
    "proto",
    "python",
    "regex",
    "scss",
    "sql",
    "svelte",
    "swift",
    "terraform",
    "toml",
    "twig",
    "typescript",
    "v",
    "vim",
    "vue",
    "yaml",
    "zig",
  }
}

return M
