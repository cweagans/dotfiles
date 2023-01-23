local M = {

  disabled = {
    n = {
      -- nvimtreetoggle
      ["<C-n>"] = "",
    },
  },

  -- UI mappings.
  ui = {
    n = {
      ["<leader>1"] = {"<cmd> NvimTreeToggle <CR>", "toggle nvimtree"},
      ["<leader>2"] = {"<cmd> Telescope buffers <CR>", "list open buffers"},
      ["<leader>gp"] = {"<cmd> Telescope projects <CR>", "goto project"},
    }
  },

  -- Basic movement, actions, etc.
  basic = {
    n = {
      -- Yank from the cursor to the end of the line to be consistent with C and D.
      ["Y"] = {"y$"},

      -- Home and End sohuld go to the beginning and end of a buffer, rather than the line.
      ["<Home>"] = {"gg"},
      ["<End>"] = {"G"},

      -- Clear searches on ESC.
      ["<Esc>"] = {'<cmd>let @/ = ""<cr><esc>'},

      -- Better go to mark mapping.
      ["gm"] = {"g'"},

      -- Scrolling.
      ["<C-S-j>"] = {"10<C-e>"},
      ["<C-S-k>"] = {"10<C-y>"},

      -- Resize windows
      ["<C-s>"] = {":resize -2<cr>", "make current window shorter"},
      ["<C-t>"] = {":resize +2<cr>", "make current window taller"},
      ["<C-n>"] = {":vertical resize -2<cr>", "make current window narrower"},
      ["<C-w>"] = {":vertical resize +2<cr>", "make current window wider"},

      ["<D-c>"] = {"y"},
      ["<D-v>"] = {"p"},
    },

    v = {
      ["<D-c>"] = {"y"},
      ["<D-v>"] = {"p"},
    }
  },
}

return M
