-- [[ Oil.nvim file explorer ]]

return {
  "stevearc/oil.nvim",
  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
  },
  keys = {
    {
      "<leader>e",
      function()
        if vim.bo.filetype == 'oil' then
          require("oil.actions").close.callback()
        else
          vim.cmd('Oil')
        end
      end
    }
  },
  dependencies = {{ "echasnovski/mini.icons", opts = {} }},
  lazy = false,
}
