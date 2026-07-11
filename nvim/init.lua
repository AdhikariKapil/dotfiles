require("vim._core.ui2").enable({})

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("plugins.pack")
require("config.terminal")

vim.opt.clipboard = "unnamedplus"

--=== COLOR SCHEMES ===--
vim.cmd.colorscheme("unokai")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "MsgSeparator", { bg = "NONE", fg = "NONE" })
