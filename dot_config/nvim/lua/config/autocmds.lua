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

-- Open the dashboard for new tabs.
-- TODO: This will also trigger the dashboard when `:tabnew filename.txt` is used. Make it not do that.
vim.api.nvim_create_autocmd("TabNewEntered", {
  command = "Dashboard",
})

-- Apply and restore local patches on plugin update/install
-- Credit: @Bekaboo in Bekaboo/nvim
vim.api.nvim_create_autocmd("User", {
  pattern = { "LazyInstall*", "LazyUpdate*" },
  group = vim.api.nvim_create_augroup("LazyPatches", { clear = true }),
  desc = "Reverse/apply local patches on updating/installing plugins",
  callback = function(info)
    local patches_path = vim.fn.stdpath("config") .. "/patches"
    print(patches_path)
    for patch in vim.fs.dir(patches_path) do
      local patch_path = patches_path .. "/" .. patch
      local plugin_path = vim.fn.stdpath("data") .. "/lazy/" .. (patch:gsub("%.patch$", ""))

      local gitcmd = function(path, cmd)
        local shell_args = { "git", "-C", path, unpack(cmd) }
        local shell_out = vim.fn.system(shell_args)
        return {
          success = (vim.v.shell_error == 0),
          output = shell_out,
        }
      end

      if vim.fn.filereadable(patch_path) then
        if info.match:match("Pre$") and gitcmd(plugin_path, { "diff", "--stat" }).output ~= "" then
          vim.notify("reverting plugin patch" .. patch_path)
          gitcmd(plugin_path, { "apply", "--reverse", "--ignore-space-change", patch_path })
        else
          vim.notify("applying plugin patch" .. patch_path)
          gitcmd(plugin_path, { "apply", "--ignore-space-change", patch_path })
        end
      end
    end
  end,
})
