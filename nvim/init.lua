require("vim._core.ui2").enable({})

require("options")
require("keymaps")
require("commands")
require("pack")

-- LateX settings
require("latex")
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

vim.cmd.colorscheme("moonfly")
vim.opt.clipboard = "unnamedplus"
