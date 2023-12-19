return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.close_if_last_window = true
      opts.filesystem.filtered_items = {
        visible = true,
        never_show = {
          ".DS_Store",
          "thumbs.db",
          ".git",
        },
      }
      opts.source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem" },
          { source = "document_symbols" },
        },
      }

      opts.window.position = "right"
      opts.window.mappings[">"] = nil
      opts.window.mappings["<"] = nil
      opts.window.mappings["["] = "prev_source"
      opts.window.mappings["]"] = "next_source"

      return opts
    end,
  },
}
