local TodoComments = require("todo-comments")
TodoComments.setup({
	keywords = {
		FIX = {
			icon = " ", -- icon used for the sign, and in search results
			color = "error", -- can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
			-- signs = false, -- configure signs for some keywords individually
		},
		TODO = { icon = " ", color = "info", alt = { "Personal" } },
		HACK = { icon = " ", color = "warning", alt = { "DON SKIP" } },
		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "hint", alt = { "INFO", "READ", "COLORS", "Custom" } },
		TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		FORGETNOT = { icon = " ", color = "hint" },
	},

	-- Patterns for hl markdown support
	highlight = {
		multiline = true,
		multiline_pattern = "^.",
		multiline_context = 10,
		before = "",
		keyword = "wide",
		after = "fg",
		pattern = {
			[[.*<(KEYWORDS)\s*:]], -- default pattern
			[[<!--\s*(KEYWORDS)\s*:.*-->]], -- HTML comments with colon
			[[<!--\s*(KEYWORDS)\s*.*-->]], -- HTML comments without colon
		},
		comments_only = false, -- Highlighting outside of comments
	},
})

vim.keymap.set("n", "<leader>st", "<cmd>TodoQuickFix<CR>", { desc = "Todo Quick Fix" })
vim.keymap.set("n", "[[", function()
	TodoComments.jump_next()
end, { desc = "Next todo comment" })
vim.keymap.set("n", "]]", function()
	TodoComments.jump_prev()
end, { desc = "Previous todo comment" })
