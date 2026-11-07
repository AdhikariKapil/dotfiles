require("dbee").setup({
	-- Specify a default connection id (leave as nil if not needed)
	default_connection = nil,

	-- Loads connections from environment variables and a persistence file
	sources = {
		require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
		require("dbee.sources").FileSource:new(vim.fn.stdpath("state") .. "/dbee/persistence.json"),
	},

	-- Extra helpers per connection type (empty by default)
	extra_helpers = {},

	-- Options passed to floating windows
	float_options = {},

	-- ==========================================
	-- Drawer (Tree) Configuration
	-- ==========================================
	drawer = {
		window_options = {},
		buffer_options = {},
		disable_help = false,
		mappings = {
			-- Manually refresh drawer
			{ key = "r", mode = "n", action = "refresh" },
			-- action_1: opens a note or executes a helper
			{ key = "<CR>", mode = "n", action = "action_1" },
			-- action_2: renames a note or sets the connection as active
			{ key = "cw", mode = "n", action = "action_2" },
			-- action_3: deletes a note or connection
			{ key = "dd", mode = "n", action = "action_3" },
			-- Toggle expand/collapse of a node
			{ key = "o", mode = "n", action = "toggle" },
			-- Menu popup mappings
			{ key = "<CR>", mode = "n", action = "menu_confirm" },
			{ key = "y", mode = "n", action = "menu_yank" },
			{ key = "<Esc>", mode = "n", action = "menu_close" },
			{ key = "q", mode = "n", action = "menu_close" },
		},
		disable_candies = false,
		candies = {
			-- (Icon definitions omitted for brevity – see full source for all icons)
			connection = { icon = "", icon_highlight = "SpecialChar", text_highlight = "" },
			table = { icon = "", icon_highlight = "Conditional", text_highlight = "" },
			-- ... and many more
		},
	},

	-- ==========================================
	-- Results Window Configuration
	-- ==========================================
	result = {
		window_options = {},
		buffer_options = {},
		page_size = 100,
		focus_result = true,
		progress = {
			spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
			text_prefix = "Executing...",
		},
		mappings = {
			{ key = "L", mode = "", action = "page_next" },
			{ key = "H", mode = "", action = "page_prev" },
			{ key = "E", mode = "", action = "page_last" },
			{ key = "F", mode = "", action = "page_first" },
			{ key = "yaj", mode = "n", action = "yank_current_json" },
			{ key = "yaj", mode = "v", action = "yank_selection_json" },
			{ key = "yaJ", mode = "", action = "yank_all_json" },
			{ key = "yac", mode = "n", action = "yank_current_csv" },
			{ key = "yac", mode = "v", action = "yank_selection_csv" },
			{ key = "yaC", mode = "", action = "yank_all_csv" },
			{ key = "<C-c>", mode = "", action = "cancel_call" },
		},
	},

	-- ==========================================
	-- Editor (Scratchpad) Configuration
	-- ==========================================
	editor = {
		directory = vim.fn.expand("~/dev/dbee_scripts"),
		window_options = {},
		buffer_options = {},
		-- directory = "path/to/scratchpad/dir", -- Optional custom directory
		mappings = {
			{ key = "BB", mode = "v", action = "run_selection" },
			{ key = "BB", mode = "n", action = "run_file" },
			{ key = "<CR>", mode = "n", action = "run_under_cursor" },
		},
	},

	-- ==========================================
	-- Call Log Window Configuration
	-- ==========================================
	call_log = {
		window_options = {},
		buffer_options = {},
		mappings = {
			{ key = "<CR>", mode = "", action = "show_result" },
			{ key = "<C-c>", mode = "", action = "cancel_call" },
		},
		disable_candies = false,
		candies = {
			-- (Call state icon definitions)
			executing = { icon = "", icon_highlight = "Constant", text_highlight = "Constant" },
			archived = { icon = "", icon_highlight = "Title", text_highlight = "" },
			-- ... etc.
		},
	},

	-- ==========================================
	-- Window Layout (Critical for opening the UI)
	-- ==========================================
	window_layout = require("dbee.layouts").Default:new(),
})

vim.keymap.set("n", "<leader>db", "<cmd>Dbee open<CR>", { desc = "Open DBee UI" })
