return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    config = function()
        local luasnip = require("luasnip")
        local cmp = require("cmp")

        local mappings = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-e>"] = cmp.mapping.abort(),
        })

        local sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "nvim_lsp_signature_help" }
        }, {
            { name = "buffer" },
            { name = "path" },
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = mappings,
            sources = sources,
            formatting = {
                fields = { "kind", "abbr" },
                format = require("lspkind").cmp_format({
                    mode = "symbol",
                    maxwidth = { abbr = 70, },
                    ellipsis_char = "...",
                })
            },
            window = {
                completion = {
                    border = "rounded",
                    winblend = 30,
                    scrollbar = false,
                    max_height = 50,
                },
                documentation = {
                    border = "rounded",
                    winblend = 30,
                    scrollbar = false,
                },
            },
        })

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
    end,
}
