-- [[ Plugins ]]

return {
    "navarasu/onedark.nvim",
    "nvim-telescope/telescope.nvim",
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"}
    },
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "kdheepak/lazygit.nvim",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    "lewis6991/gitsigns.nvim"
}
