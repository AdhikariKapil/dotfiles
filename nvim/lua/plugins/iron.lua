local iron = require("iron.core")
local view = require("iron.view")
local common = require("iron.fts.common")
local function jump_to_cell(direction)
	-- The function look for the patterns defined in block_dividers
	local pattern = "^# %%"
	local flags = "Wzs"

	if direction == -1 then
		flags = "b" .. flags -- Add 'b' for backward search
	end

	-- Perform the search
	vim.fn.search(pattern, flags)

	-- Center the screen on the new cell header
	vim.cmd("normal! zz")
end

vim.keymap.set("n", "[z", function()
	jump_to_cell(1)
end, { desc = "Jump to next cell" })

vim.keymap.set("n", "]z", function()
	jump_to_cell(-1)
end, { desc = "Jump to previous cell" })

local REPL_WIDTH = "45"

iron.setup({
	config = {
		-- Whether a repl should be discarded or not
		scratch_repl = true,
		-- Your repl definitions come here
		repl_definition = {
			sh = {
				-- Can be a table or a function that
				-- returns a table (see below)
				command = { "zsh" },
			},

			python = {
				command = { "ipython", "--no-autoindent" },
				format = common.bracketed_paste_python,
				block_dividers = { "# %%", "#%%", "# cell", "#cell" },
				env = {
					PYTHON_BASIC_REPL = "1",
					MPLBACKEND = "TkAgg",
				},
			},
		},
		repl_filetype = function(bufnr, ft)
			return ft
		end,
		dap_integration = true,
		repl_open_cmd = view.split.horizontal.botright(REPL_WIDTH .. "%"),
	},
	keymaps = {
		toggle_repl = "<leader>ir",
		restart_repl = "<leader>iR",
		send_motion = "<leader>is",
		visual_send = "is",
		send_file = "<leader>iS",
		send_line = "il",
		send_code_block = "<leader>ij",
		send_code_block_and_move = "ij",
		exit = "<leader>iq",
		clear = "<leader>ic",
	},
	highlight = {
		italic = true,
	},
	ignore_blank_lines = true,
})
