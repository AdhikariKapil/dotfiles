vim.g.mapleader = " "

-- Replace selected text WITHOUT losing what you losing
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

-- Delete text without saving it to any register
vim.keymap.set({ "n", "v" }, "d", [["_d]], { desc = "Delete without yanking" })

-- vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlighting" })

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

-- Keymap for splits resizing
local opts = { silent = true }
vim.keymap.set("n", "<A-h>", ":vertical resize +3<CR>", opts)
vim.keymap.set("n", "<A-l>", ":vertical resize -3<CR>", opts)
vim.keymap.set("n", "<A-j>", ":resize -3<CR>", opts)
vim.keymap.set("n", "<A-k>", ":resize +3<CR>", opts)

-- Keymap for splits
vim.keymap.set("n", "<leader>'", "<C-w>v", { desc = "Vertical Split" })
vim.keymap.set("n", '<leader>"', "<C-w>s", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize Split" })

-- Toggle maximize for splits
local zoomed = false
vim.keymap.set("n", "<leader>z", function()
	if zoomed then
		vim.cmd("wincmd =")
		zoomed = false
	else
		vim.cmd("wincmd |")
		vim.cmd("wincmd _")
		zoomed = true
	end
end, { desc = "Toggle maximize" })

vim.keymap.set(
	"n",
	"<leader>RE",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)
vim.keymap.set("n", "<leader>re", "<CMD>restart<CR>", { desc = "Restart config :restart)" })

vim.keymap.set("n", "<leader>msg", "<CMD>message<CR>")

-- Swaping zz and zt
vim.keymap.set("n", "zz", "zt", { noremap = true, silent = true })
vim.keymap.set("n", "zt", "zz", { noremap = true, silent = true })

-- Map Ctrl + L to move right in Insert mode
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", { desc = "Move Right (stay in Insert Mode)" })

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

-- Vim Splits max and min
vim.keymap.set("n", "<leader>m", function()
	if vim.fn.winnr("$") > 1 then
		-- Multiple windows open: maximize current
		vim.cmd("tab split")
	else
		-- Only one window (already maximized): close tab, go back
		vim.cmd("tabclose")
	end
end, { desc = "Toggle maximize current window" })
