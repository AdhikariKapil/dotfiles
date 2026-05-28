require("notify").setup({
	background_colour = "#000000",
	fps = 30,
	level = 2,
	minimum_width = 10,
	max_width = 60,
	render = "wrapped-compact",
	stages = "static",
	timeout = 4000,
	top_down = true,
	on_open = nil,
	on_close = nil,
})
vim.notify = require("notify")

vim.keymap.set("n", "<leader>nt", "<cmd>Telescope notify<CR>", { desc = "Notify History" })
