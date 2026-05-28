require("lualine").setup({
	options = {
		theme = {
			normal = {
				a = { fg = "#ffffff", bg = "#0a0a0a" },
				b = { fg = "#aaaaaa", bg = "#0a0a0a" },
				c = { fg = "#888888", bg = "#0a0a0a" },
			},
			insert = {
				a = { fg = "#ffffff", bg = "#0a0a0a" },
				b = { fg = "#aaaaaa", bg = "#0a0a0a" },
				c = { fg = "#888888", bg = "#0a0a0a" },
			},
			visual = {
				a = { fg = "#ffffff", bg = "#0a0a0a" },
				b = { fg = "#aaaaaa", bg = "#0a0a0a" },
				c = { fg = "#888888", bg = "#0a0a0a" },
			},
			command = {
				a = { fg = "#ffffff", bg = "#0a0a0a" },
				b = { fg = "#aaaaaa", bg = "#0a0a0a" },
				c = { fg = "#888888", bg = "#0a0a0a" },
			},
		},
		section_separators = "",
		component_separators = "",
		icons_enabled = true,
		colored = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_m = { "filename" },
		lualine_x = { "progress" },
		lualine_z = { "location" },
	},
})
