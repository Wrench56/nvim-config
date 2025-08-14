-- [[ Nvim-Tree file explorer ]]

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", function()
          require("nvim-tree.api").tree.toggle()
        end,
        desc = "Toggle file explorer"
      },
    },
    opts = {
      sort = { sorter = "case_sensitive" },
      view = { width = 30 },
      renderer = { group_empty = true },
    },
  }
}
