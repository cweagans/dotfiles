-- If Godot is not installed, don't add anything to the installation.
local gdpath = "/Applications/Godot.app"
if not vim.loop.fs_stat(gdpath) then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "gdscript",
        "godot_resource",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gdscript = {},
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local nls = require("null-ls")
        vim.list_extend(opts.sources, {
          nls.builtins.diagnostics.gdlint,
          nls.builtins.diagnostics.gdformat,
        })
      end
    end,
  },
  -- TODO: Looks like Godot itself exposes a debug port? Can we use that?
}
