vim.pack.add({
	-- Emmet
	"https://github.com/olrtg/nvim-emmet",
	"https://github.com/roobert/tailwindcss-colorizer-cmp.nvim",
	"https://github.com/nvim-lua/plenary.nvim",

	-- Harpoon
	"https://github.com/theprimeagen/harpoon",

	-- LazyGit
	"https://github.com/kdheepak/lazygit.nvim",

	--Telescope
	"https://github.com/nvim-telescope/telescope.nvim",

	-- Vim Fugitive
	"https://github.com/tpope/vim-fugitive",

	-- -- Vim-Dadbod
	-- "https://github.com/tpope/vim-dadbod",
	-- "https://github.com/kristijanhusak/vim-dadbod-ui",

	-- DBee
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/kndndrj/nvim-dbee",

	-- TodoComments
	"https://github.com/folke/todo-comments.nvim",

	--  TmuxNavigateRight
	"https://github.com/christoomey/vim-tmux-navigator",

	-- nvimTree
	"https://www.github.com/nvim-tree/nvim-tree.lua",

	-- Fzf-lau
	"https://www.github.com/ibhagwan/fzf-lua",

	-- Icons
	"https://github.com/nvim-tree/nvim-web-devicons",

	-- Mini
	"https://github.com/echasnovski/mini.nvim",

	-- GitSigns
	"https://github.com/lewis6991/gitsigns.nvim",

	-- Treesitter
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},

	-- Language Server Protocol
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",

	-- Formatters
	"https://github.com/stevearc/conform.nvim",

	-- Completion
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	{
		src = "https://github.com/Saghen/blink.lib",
	},
	"https://github.com/L3MON4D3/LuaSnip",

	-- Code Companion
	{ src = "https://github.com/olimorris/codecompanion.nvim", branch = "main" },

	-- Iron.nvim
	"https://github.com/Vigemus/iron.nvim",

	-- Markdown renderer and preview
	"https://github.com/meanderingprogrammer/render-markdown.nvim",
	"https://github.com/selimacerbas/mdkite.nvim",
	-- MdKite dependencies
	"https://github.com/selimacerbas/kitehost.nvim",
})

-- Nvim-Tree
require("plugins.nvimTree")

-- Fzf-Lua
require("plugins.fzfLua")

-- Icons

-- Mini
require("plugins.miniNvim")

-- GitSigns
require("plugins.gitSigns")

-- TreeSitter
require("plugins.treesitter")

-- LSP
require("plugins.lsp")

-- Linters and Formatters
require("plugins.formatting")

-- Completion and Snippets
require("plugins.completion")

-- AI
require("plugins.companion")

-- Harpoon
require("plugins.mygoatHarpoon")

-- TodoComments
require("plugins.todoComments")

-- Iron
require("plugins.iron")

-- Markdown Preview (MdKite)
require("plugins.markdown-preview")

-- LazyGit
require("telescope").load_extension("lazygit")
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gl", "<cmd>LazyGitLog<CR>", { desc = "Lazygit Logs" })

-- Vim Fugitive
vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git Status" })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git Push" })

--DBee
require("plugins.databasebee")

-- Dadbod
-- vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Open DB UI" })
-- vim.keymap.set("n", "<leader>dc", "<cmd>DBUIClose<CR>", { desc = "Close DB UI" })
-- vim.keymap.set("n", "<leader>dq", "<cmd>DBUIFindBuffer<CR>", { desc = "Find DB Buffer" })
