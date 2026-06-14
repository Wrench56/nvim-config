-- [[ Onedark.nvim colorscheme ]]

return {
  "navarasu/onedark.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("onedark").load()
  end,
}
