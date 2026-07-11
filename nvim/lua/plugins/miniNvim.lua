require("mini.ai").setup({})
require("mini.surround").setup({})
require("mini.pairs").setup({})
require("mini.comment").setup({})
require("mini.move").setup({})
require("mini.indentscope").setup({})
require("mini.trailspace").setup({})
require("mini.bufremove").setup({})
require("mini.icons").setup({})
require("mini.cursorword").setup()
require("mini.notify").setup({
	lsp_progress = {
		enable = false,
	},
})
require("mini.hipatterns").setup({
	highlighters = {
		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
		cell = {
			pattern = { "^# %%.*", "^#cell.*", "^#%%.*", "^# cell.*" },
			-- another great group is Visual
			group = "Search", -- Hightligh group to use
			priority = 1000, -- priority of the highlighter
		},
		imp = {
			pattern = { "^###.*" },
			group = "Visual",
			priority = 1000,
		},
	},
})

-- Helper to apply your custom highlights
local function fix_cursorword_hl()
	vim.api.nvim_set_hl(0, "MiniCursorword", { bg = "#2e2e2e", underline = false })
	vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = "#3a3a3a", underline = false })
end

-- Apply now (in case colourscheme already loaded)
fix_cursorword_hl()

-- Re‑apply every time a colourscheme is set
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = fix_cursorword_hl,
})
