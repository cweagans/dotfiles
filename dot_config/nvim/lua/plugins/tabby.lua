return {
  "nanozuki/tabby.nvim",
  -- TODO: lazy load this plugin
  lazy = false,
  config = function()
    require("tabby.tabline").use_preset("tab_only", {
      nerdfont = false,
      lualine_theme = "dracula",
    })
  end,
  keys = {
    {
      "<leader><tab>r",
      "<cmd>lua vim.ui.input({prompt = 'Enter a new tab name: '}, function(name) if (name == '') then vim.notify('Tab name is required', vim.log.levels.ERROR) return end vim.cmd('TabRename ' .. name) end)<CR>",
      desc = "Rename tab",
    },
  },
}
