return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      -- TODO: Open PR against lazyvim to add this to the go plugin.
      "gopls",

      -- TODO: Open a PR against lazyvim to add this to the docker plugin.
      "dockerfile-language-server",

      -- TODO: Open a PR against lazyvim to add this to the YAML plugin.
      "yaml-language-server",
      "yamllint",

      -- TODO: Open a PR against lazyvim to add some extra Lua packages.
      "lua-language-server",
      "luacheck",

      -- TODO: Open a PR against lazyvim to add a Bash language plugin.
      "bash-language-server",
      "bash-debug-adapter",
      "shfmt",
    })
  end,
}
