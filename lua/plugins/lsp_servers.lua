-- [[ LSP servers ]]
local lspconfig = require('lspconfig')

lspconfig.asm_lsp.setup({})
lspconfig.ccls.setup({})

lspconfig.rust_analyzer.setup({
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy"
            },
            diagnostics = {
                enable = true
            }
        }
    }
})
