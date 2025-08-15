-- [[ Keymaps ]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Terminal keybinds
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-w><C-w>", [[<C-\><C-n><C-w>w]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":vsp | term<CR>a", { noremap = true, silent = true })

-- Diagnostics
-- Local buffer
local diag_ll = { enabled = false, src_win = nil, src_buf = nil }

vim.keymap.set("n", "<leader>p", function()
  diag_ll.src_win = vim.api.nvim_get_current_win()
  diag_ll.src_buf = vim.api.nvim_get_current_buf()
  diag_ll.enabled = true

  vim.api.nvim_win_call(diag_ll.src_win, function()
    vim.diagnostic.setloclist({ open = true })
  end)
end, { noremap = true, silent = true, desc = "Show buffer diagnostics" })

-- Auto-update the diagnostics buffer on new diagnostics
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function(args)
    if not diag_ll.enabled then return end
    if diag_ll.src_buf ~= args.buf then return end
    if not vim.api.nvim_win_is_valid(diag_ll.src_win) then
      diag_ll.enabled = false
      return
    end

    vim.api.nvim_win_call(diag_ll.src_win, function()
      vim.diagnostic.setloclist({ open = true })
    end)
  end,
})

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function(ev)
    local closed_win = tonumber(ev.match)

    if diag_ll.enabled and diag_ll.src_win == closed_win then
      diag_ll.enabled = false
      return
    end

    if diag_ll.enabled and vim.api.nvim_win_is_valid(diag_ll.src_win) then
      local info = vim.fn.getloclist(vim.fn.win_id2win(diag_ll.src_win), { winid = 0 })
      if type(info) == "table" and info.winid and info.winid == closed_win then
        diag_ll.enabled = false
      end
    end
  end,
})

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

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
