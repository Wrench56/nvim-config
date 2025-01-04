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
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy"
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "UiEnter"
    },
    "lewis6991/gitsigns.nvim",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        event = "VeryLazy"
    }
}
