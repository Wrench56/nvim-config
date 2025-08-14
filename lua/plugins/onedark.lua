-- [[ Onedark.nvim colorscheme ]]

return {
  "navarasu/onedark.nvim",
  priority = 99,
  lazy = false,
  config = function()
    require("onedark").load()
  end,
}
