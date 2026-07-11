require("gitsigns").setup({
    signs = {
      add          = { text = '' },  -- nf-fa-plus_circle
      change       = { text = '' },  -- nf-fa-pencil
      delete       = { text = '' },  -- nf-fa-minus_circle
      topdelete    = { text = '' },
      changedelete = { text = '' },
      untracked    = { text = '' },  -- nf-fa-question_circle
    },
    signs_staged = {
      add          = { text = '' },
      change       = { text = '' },
      delete       = { text = '' },
      topdelete    = { text = '' },
      changedelete = { text = '' },
      untracked    = { text = '' },
    },
    signcolumn = true,
    current_line_blame = false,
})

vim.keymap.set('n', ']c', function()
    if vim.wo.diff then return ']h' end
    vim.schedule(function() package.loaded.gitsigns.next_hunk() end)
    return '<Ignore>'
end, { expr = true })

vim.keymap.set('n', '[h', function()
    if vim.wo.diff then return '[h' end
    vim.schedule(function() package.loaded.gitsigns.prev_hunk() end)
    return '<Ignore>'
end, { expr = true })
vim.keymap.set('n', '<leader>hp', "<cmd>Gitsigns preview_hunk<CR>")
