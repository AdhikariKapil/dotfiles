vim.keymap.set("n", "<leader>a", "<cmd>:lua require('harpoon.mark').add_file()<CR>", { desc = "Add file to harpoon" })
vim.keymap.set(
	"n",
	"<leader>h",
	"<cmd>:lua require('harpoon.ui').toggle_quick_menu()<CR>",
	{ desc = "Open harpoon ui" }
)
vim.keymap.set("n", "L", "<cmd>:lua require('harpoon.ui').nav_next()<CR>", { desc = "Navigate next mark" })
vim.keymap.set("n", "H", "<cmd>:lua require('harpoon.ui').nav_prev()<CR>", { desc = "Navigate previous mark" })

vim.keymap.set(
	"n",
	"<leader>t",
	"<cmd>:lua require('harpoon.term').gotoTerminal(1)<CR>",
	{ desc = "Navigate to terminal" }
)
vim.keymap.set(
	"n",
	"<leader>tt",
	"<cmd>:lua require('harpoon.tmux').gotoTerminal(1)<CR>",
	{ desc = "Navigate to first tmux window " }
)

