-- [[ LSP ]]

return {
  { "hrsh7th/cmp-nvim-lsp" },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local lspconfig = require("lspconfig")
      local default_cap = lspconfig.util.default_config.capabilities or vim.lsp.protocol.make_client_capabilities()
      local cmp_cap = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.util.default_config.capabilities = vim.tbl_deep_extend("force", default_cap, cmp_cap)

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP keymaps",
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }
          local map = vim.keymap.set
          map("n", "K",  vim.lsp.buf.hover,          opts)
          map("n", "gd", vim.lsp.buf.definition,     opts)
          map("n", "gD", vim.lsp.buf.declaration,    opts)
          map("n", "gi", vim.lsp.buf.implementation, opts)
          map("n", "go", vim.lsp.buf.type_definition,opts)
          map("n", "gr", vim.lsp.buf.references,     opts)
          map("n", "gs", vim.lsp.buf.signature_help, opts)
          map("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
          map({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end, opts)
          map("n", "<F4>", vim.lsp.buf.code_action,  opts)
        end,
      })

      -- LSP Servers --
      lspconfig.asm_lsp.setup({})
      lspconfig.ccls.setup({})

      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" },
            diagnostics = { enable = true },
          },
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
        },
        snippet = {
          expand = function(args) vim.snippet.expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-o>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"]  = cmp.mapping.confirm({ select = true }),
        }),
      })
    end,
  },
}
