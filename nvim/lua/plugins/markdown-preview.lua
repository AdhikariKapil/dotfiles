require("mdkite").setup({
	open_browser = true,
	browser = "zen-browser",
	default_theme = "dark",
})

vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle Markdown Renderer" })

vim.keymap.set("n", "<leader>mk", "<cmd>MdKite toggle<CR>", { desc = "Toggle MdKite Preview" })
