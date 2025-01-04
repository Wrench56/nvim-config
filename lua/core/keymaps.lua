-- [[ Keymaps ]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Terminal keybinds
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-w><C-w>', [[<C-\><C-n><C-w>w]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':vsp | term<CR>', { noremap = true, silent = true })
