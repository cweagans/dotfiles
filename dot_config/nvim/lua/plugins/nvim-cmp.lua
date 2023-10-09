return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    -- Disable completion in comments (except for in command mode) and in neo-tree popups.
    opts.enabled = function()
      if vim.bo.filetype == "neo-tree-popup" then
        return false
      end

      local context = require("cmp.config.context")
      if vim.api.nvim_get_mode().mode == "c" then
        return true
      else
        return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
      end
    end

    -- Use up and down arrows to navigate the completion menu.
    local cmp = require("cmp")
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Down>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<Up>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}
