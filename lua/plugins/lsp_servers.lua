-- [[ LSP servers ]]

require('lspconfig').asm_lsp.setup({})
require('lspconfig').rust_analyzer.setup({
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy";
            },
            diagnostics = {
                enable = true;
            }
        }
    }
})
