-- GUI settings for Neovide.
if vim.g.neovide ~= nil then
	--- Turn down the animation length just a smidge.
	vim.g.neovide_cursor_animation_length = 0.04

	--- No point in running at a buttery smooth 60fps if the window isn't focused.
	vim.g.neovide_no_idle = false

	--- Window and titlebar color settings.
	vim.g.neovide_transparency = 0.0
	vim.g.transparency = 0.0
	vim.g.neovide_background_color = "#2E3440"

	-- Cmd key should work as expected in neovide.
	vim.g.neovide_input_use_logo = true
end

local o = vim.opt
--- Keep 10k commands in history.
o.history = 10000
-- Allow positioning the cursor one character after the end of the line.
o.virtualedit = "onemore"
-- Allow backspacing through indents, EOL, and start of insert.
o.backspace = "indent,eol,start"
-- Show problematic whitespace.
o.list = true
o.listchars = "tab:→ ,trail:•,precedes:←,extends:→,nbsp:␣"
-- Lines to scroll when the cursor leaves the screen.
o.scrolljump = 5
-- Minimum visible lines to keep above or below the cursor.
o.scrolloff = 3

-- Format buffers on safe with LSP if possible.
vim.api.nvim_create_autocmd("BufWritePre", {
	buffer = buffer,
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
