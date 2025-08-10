-- [[ Config ]]

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable line number
vim.wo.number = true

-- Configure <Tab> behaviour
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Configure clipboard
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Enable cursorline
vim.opt.cursorline = true

-- Set custom split layout
vim.opt.splitright = true
vim.opt.splitbelow = true

