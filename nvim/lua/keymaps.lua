vim.g.mapleader = " "

-- Replace selected text WITHOUT losing what you losing
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

-- Delete text without saving it to any register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader><Esc>", ":nohl<CR>", { desc = "Clear search highlighting" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves line up in visual selection" })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

vim.keymap.set("n", "<leader>rr", "<cmd>e!<CR>", { desc = "Relaod the file from disk." })

vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Fast quit " })
vim.keymap.set("n", "<leader>qq", "<cmd>q!<CR>", { desc = "Force quit" })

vim.keymap.set(
	"n",
	"<leader>RE",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)
vim.keymap.set("n", "<leader>X", "<CMD>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

vim.keymap.set("n", "<leader>re", "<CMD>restart<CR>", { desc = "Restart config :restart)" })

vim.keymap.set("n", "<leader>msg", "<CMD>message<CR>")

-- Swaping zz and zt
vim.keymap.set("n", "zz", "zt", { noremap = true, silent = true })
vim.keymap.set("n", "zt", "zz", { noremap = true, silent = true })

-- Map Ctrl + L to move right in Insert mode
vim.api.nvim_set_keymap("i", "<M-l>", "<Right>", { desc = "Move Right (stay in Insert Mode)" })

-- native undotree
vim.keymap.set("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })

-- custom to navigate between buffers
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
