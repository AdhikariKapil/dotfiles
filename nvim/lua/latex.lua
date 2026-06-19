vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
vim.g.tex_flavour = "latex"

vim.g.vimtex_enabled = 1
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_compiler_latexmk = {
	build_dir = "",
	options = {
		"-verbose",
		"-file-line-error",
		"-synctex=1",
		"-interaction=nonstopmode",
	},
}

--== Viewer Setting ==--
vim.g.vimtex_view_automatic = 0 -- automatically open view on compile
vim.g.vimtex_view_method = "zathura"

vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		local opts = { buffer = true, silent = true }

		-- VimteX
		vim.keymap.set("n", "<leader>c", "<cmd>VimtexCompile<CR>", opts) -- Close
		vim.keymap.set("n", "<leader>v", "<cmd>VimtexView<CR>", opts) -- Sync
		vim.keymap.set("n", "<leader>p", "<cmd>VimtexTocOpen<CR>", opts)
	end,
})
