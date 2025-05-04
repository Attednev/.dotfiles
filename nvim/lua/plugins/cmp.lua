return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local cmp = require("cmp")
        require('luasnip.loaders.from_vscode').lazy_load()

        local luasnip = require 'luasnip'
        luasnip.config.setup {}

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                ["<C-e>"] = cmp.mapping.abort(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = 'buffer' },
                { name = 'path' },
            }),
        })

        local cmdline_loaded = false
        vim.api.nvim_create_autocmd("CmdlineEnter", {
            callback = function()
                if cmdline_loaded then
                    return
                end

                cmp.setup.cmdline({ "/", "?" }, {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = { { name = "buffer" } }
                })

                cmp.setup.cmdline(":", {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources(
                        { { name = "path" } },
                        { { name = "cmdline" } }
                    )
                })

                cmdline_loaded = true
            end
        })
    end,
}
