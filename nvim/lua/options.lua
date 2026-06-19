vim.opt.timeoutlen = 400

vim.g.netrw_banner = 0
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.cmdheight = 0
vim.opt.laststatus = 0

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")

vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")
-- vim.opt.guicursor = ""

vim.opt.colorcolumn = "0"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

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

-- Splits Indicator
vim.opt.fillchars = {
	vert = "│",
	horiz = "─",
}

vim.api.nvim_set_hl(0, "WinSeparator", {
	fg = "#6c7086",
})

vim.api.nvim_set_hl(0, "NormalNC", {
	bg = "#0d0d0d",
})

-- -- Show cmdheight when entering command-line mode
-- vim.api.nvim_create_autocmd("CmdlineEnter", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.opt.cmdheight = 1
-- 	end,
-- })
--
-- -- Hide it again when leaving
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.opt.cmdheight = 1 -- Keep at 1 briefly, then hide
-- 		vim.defer_fn(function()
-- 			vim.opt.cmdheight = 0
-- 		end, 100)
-- 	end,
-- })
