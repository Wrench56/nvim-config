-- [[ Nvim-Tree file explorer ]]

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive"
    },
    view = {
        width = 30
    },
    renderer = {
        group_empty = true
    },
    filters = {
        dotfiles = true
    }
})

local api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>e", api.tree.toggle, { desc = "Toggle file explorer" })
