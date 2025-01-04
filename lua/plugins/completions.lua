-- [[ Completions ]]

local cmp = require("cmp")

cmp.setup({
    sources = {{
        name = 'nvim_lsp'
    }, {
        name = 'buffer'
    }},
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true
        })
    })
})
