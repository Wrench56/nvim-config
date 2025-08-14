-- [[ Keymaps ]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Terminal keybinds
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-w><C-w>", [[<C-\><C-n><C-w>w]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":vsp | term<CR>a", { noremap = true, silent = true })

-- Diagnostics
-- Local buffer
vim.keymap.set("n", "<leader>p", function()
  vim.diagnostic.setloclist()
end, { noremap = true, silent = true, desc = "Show buffer diagnostics" })

-- Workspace
vim.keymap.set("n", "<leader>P", function()
  require("telescope.builtin").diagnostics()
end, { noremap = true, silent = true, desc = "Search workspace diagnostics" })

-- Telescope
local function tb(name)
  return function() require("telescope.builtin")[name]() end
end

vim.keymap.set("n", "<leader>ff", tb("find_files"), { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", tb("live_grep"),  { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", tb("buffers"),    { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", tb("help_tags"),  { desc = "Telescope help tags" })
