return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {

      -- TODO: Does this belong in the JSON plugin?
      "jq",

      -- TODO: Is this in the markdown plugin? Should it be?
      "mermaid",

      -- TODO: Do these belong somewhere else?
      "css",
      "diff",
      "http",
      "proto",
      "sql",
      "ssh_config",
      "toml",
    })
  end,
}
