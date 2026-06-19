require("vim._core.ui2").enable({})

require("options")
require("keymaps")
require("commands")
require("pack")

-- LateX settings
require("latex")

vim.opt.clipboard = "unnamedplus"

---=== COLOR SCHEMES ===---
-- vim.cmd.colorscheme("moonfly")
-- vim.cmd.colorscheme("unokai")

vim.cmd.colorscheme("unokai")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "MsgSeparator", { bg = "NONE", fg = "NONE" })
