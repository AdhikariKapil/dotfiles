local MiniCompletion = require("mini.completion")
MiniCompletion.setup({
	lsp_completion = {
		source_func = "completefunc",
		auto_setup = true,
		process_items = function(items, base)
			return MiniCompletion.default_process_items(items, base, {
				filtersort = "fuzzy",
			})
		end,
	},
})

local MiniPairs = require("mini.pairs")
MiniPairs.setup({})

local imap_expr = function(lhs, rhs)
	vim.keymap.set("i", lhs, rhs, { expr = true })
end
imap_expr("<M-j>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr("<M-k>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

_G.cr_action = function()
	-- If there is selected item in popup, accept it with <C-y>
	if vim.fn.complete_info()["selected"] ~= -1 then
		return "\25"
	end
	return MiniPairs.cr()
end

vim.keymap.set("i", "<CR>", "v:lua.cr_action()", { expr = true })
