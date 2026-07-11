require("nvim-tree").setup({
    view = {
        width = 35,
    },
    filters = {
        dotfiles = false,
    },
    renderer = {
        group_empty = true,
    },
})

vim.keymap.set("n", "<leader>e", function()
    local api = require("nvim-tree.api")

    if api.tree.is_visible() then
        api.tree.close()
    else
        api.tree.find_file({
            open = true,
            focus = true,
        })
    end
end, { desc = "Toggle NvimTree" })
