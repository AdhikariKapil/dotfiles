vim.opt.timeoutlen = 400 -- timeout duration
vim.opt.ttimeoutlen = 0 -- key code timeout
vim.g.netrw_banner = 0
vim.opt.winbar = "%=%t"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.inccommand = "split"

vim.opt.cmdheight = 0
vim.opt.laststatus = 0

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.termguicolors = true
vim.opt.completeopt = "menuone,noinsert,noselect,fuzzy" -- completion options
vim.opt.shortmess:append("c")
vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.winblend = 0 -- floating window transparency
vim.opt.conceallevel = 0 -- do not hide markup
vim.opt.concealcursor = "" -- do not hide cursorline in markup
vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines
vim.opt.clipboard:append("unnamedplus")

local undodir = vim.fn.expand("~/.local/state/nvim/undo")
if
	vim.fn.isdirectory(undodir) == 0 --create undo directory if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile
vim.opt.undofile = true
vim.opt.undodir = undodir
vim.opt.updatetime = 300
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = false -- do not auto-save

vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no error sounds
vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.autochdir = false -- do not autochange working directory
vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include subdirs in search
vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.modifiable = true -- allow buffer modifications
vim.opt.encoding = "UTF-8" -- set encoding

vim.opt.wildmenu = true -- tab completion
vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60") -- improve diff display
vim.redrawtime = 10000 -- increase nvim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory
