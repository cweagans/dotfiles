-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Open help buffers on the right side.
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("HelpPages", { clear = false }),
  pattern = { "help" },
  nested = true,
  callback = function()
    if not vim.w.help_is_moved or vim.w.help_is_moved ~= "right" then
      vim.cmd("wincmd L")
      vim.w["help_is_moved"] = "right"
    end
  end,
})
