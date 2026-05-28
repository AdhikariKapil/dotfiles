vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/olrtg/nvim-emmet",
	"https://github.com/roobert/tailwindcss-colorizer-cmp.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/theprimeagen/harpoon",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/tpope/vim-dadbod",
	"https://github.com/kristijanhusak/vim-dadbod-ui",
	-- "https://github.com/folke/todo-comments.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/nvim-lualine/lualine.nvim",

	-- For Path Completion
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/hrsh7th/cmp-path",

	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },

	-- colorScheme
	"https://github.com/bluz71/vim-moonfly-colors",

	-- Code Companion
	{ src = "https://github.com/olimorris/codecompanion.nvim", branch = "main" },

	-- Copilot
	{ src = "https://github.com/github/copilot.vim", branch = "main" },

	-- Copilot Chat
	{ src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim", branch = "main" },
})

---- mini files ----
local MiniFiles = require("mini.files")
MiniFiles.setup({
	mappings = {
		go_in_plus = "l",
		go_in = "<CR>",
		go_out = "_",
		go_out_plus = "h",
		close = "<Esc>",
	},
})

-- keymaps
vim.keymap.set("n", "<leader>e", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
	MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

---- mini cmdline completion ----
require("mini.cmdline").setup({
	autocorrect = { enable = true },
})

---- mini surround ----
require("mini.surround").setup()

---- mini picker ----
local MiniPick = require("mini.pick")
MiniPick.setup({
	mappings = {
		move_down = "<M-j>",
		move_up = "<M-k>",
		paste = "<M-p>",
	},
})

-- keymaps
-- vim.keymap.set("n", "<leader><leader>", function()
-- 	MiniPick.builtin.files()
-- end, { desc = "Mini File Picker" })
-- vim.keymap.set("n", "<leader>/", function()
-- 	MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
-- end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>vh", function()
	MiniPick.builtin.help({
		default_split = "vertical",
	})
end, { desc = "Mini Help" })

---- mini extra ----
local MiniExtra = require("mini.extra")
MiniExtra.setup()

-- keymaps
vim.keymap.set("n", "<leader>xx", function()
	MiniExtra.pickers.diagnostic()
end, { desc = "Mini Picker Diagnostics" })
vim.keymap.set("n", "<leader>sk", function()
	MiniExtra.pickers.keymaps()
end, { desc = "Search Keymaps" })

---- mini completions ----
require("completion")

---- Path Completion ----
local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "path" },
	},
})

---- mini snippets ----
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
	snippets = {
		MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets automatically
	},
})
MiniSnippets.start_lsp_server({ match = false })

---- mini pairs ----
require("mini.pairs").setup()

---- mini hipatterns ----
require("mini.hipatterns").setup({
	highlighters = {
		fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
		hack = { pattern = "HACK", group = "MiniHipatternsHack" },
		todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
		note = { pattern = "NOTE", group = "MiniHipatternsNote" },

		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
	},
})

---- nvim treesitter ----
require("treesitter")

---- Code Companion ----
require("companion")

---- Copilot Chat ----
require("chatwithcopilot")

---- LSP  ----
require("lsp")

---- Harpoon keymap----
require("mygoatHarpoon")

---- Conform formatting ----
require("formatting")

---- LazyGit ----
require("telescope").load_extension("lazygit")
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gl", "<cmd>LazyGitLog<CR>", { desc = "Lazygit Logs" })

---- Vim Fugitive ----
vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git Push" })
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git Commit" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git Diff" })

---- Dadbod ----
vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Open DB UI" })
vim.keymap.set("n", "<leader>dc", "<cmd>DBUIClose<CR>", { desc = "Close DB UI" })
vim.keymap.set("n", "<leader>dq", "<cmd>DBUIFindBuffer<CR>", { desc = "Find DB Buffer" })

---- TODO Comments ----
-- require("todoComments")

---- Telescope ----
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><Space>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

---- Telescope Theme ----
vim.keymap.set("n", "<leader>cs", require("telescope.builtin").colorscheme, { desc = "Pick colorscheme" })

---- nvim notify ----
require("notification")

---- Status line ----
require("statusLualine")
