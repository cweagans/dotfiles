-- lvim.builtin.which_key.mappings[";"] = { "<cmd>Alpha<CR>", "Dashboard"}

local ok, trouble = pcall(require, "trouble")
if not ok then
	return
end

lvim.builtin.telescope.defaults.mappings.i["<C-t>"] = trouble.open_with_trouble
lvim.builtin.telescope.defaults.mappings.n["<C-t>"] = trouble.open_with_trouble

lvim.builtin.which_key.mappings["t"] = {
  name = "Trouble",
  t = { "<cmd>TroubleToggle<cr>", "Toggle" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Quick Fix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "Location list" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "LSP references" },
  n = { "<cmd>lua require('trouble').next()<cr>", "Next Item" },
  p = { "<cmd>lua require('trouble').previous()<cr>", "Previous Item" },
}
