vim.opt.timeoutlen = 300

vim.g.netrw_banner = 0
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 2

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")

vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")
-- vim.opt.guicursor = ""
vim.opt.scrolloff = 10

vim.opt.colorcolumn = "0"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.opt.formatoptions:remove({ "r", "o" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.o.cmdheight = 0
-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- 	callback = function()
-- 		vim.o.cmdheight = 0
-- 	end,
-- })

-- Kill comment continuation everywhere
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove("r")
		vim.opt_local.formatoptions:remove("o")
	end,
})

-- For minimal completion popup:
vim.o.pumblend = 0
vim.o.pumheight = 8
vim.cmd([[
    hi Pmenu guibg=#0a0a0a guifg=#e0e0e0 gui=None
    hi PmenuSel guibg=#333333 guifg=#ffffff gui=NONE
    hi PmenuSbar guibg=#0a0a0a
    hi PmenuThumb guibg=#555555
    hi PmenuMatch guifg=#ffffff gui=bold
    hi PmenuMatchSel guifg=#ffffff gui=bold
]])

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
