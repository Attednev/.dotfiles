return {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "j-hui/fidget.nvim",
    },
    config = function()
        vim.diagnostic.config({
            severity_sort = true,
            underline = true,
            virtual_text = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = "",
                },
            },
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = function(d)
                    local icons = {
                        [vim.d.severity.ERROR] = " ",
                        [vim.d.severity.WARN] = " ",
                        [vim.d.severity.INFO] = " ",
                        [vim.d.severity.HINT] = " ",
                    }
                    return string.format(" %s ", icons[d.severity])
                end,
                format = function(d)
                    return string.format("%s\n→ [%s]", d.message, d.source or d.code or "")
                end,
            },
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Go to Definition" })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "LSP: Go to Declaration" })
                vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP: Go to References" })
                vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = bufnr, desc = "LSP: Go to Implementation" })
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "LSP: Go to Type Definition" })
                vim.keymap.set("n", "<leader>rn", function()
                    return ":IncRename " .. vim.fn.expand("<cword>")
                end, { buffer = bufnr, expr = true, desc = "LSP: Rename" })
                vim.keymap.set({ "n", "v" }, "<leader>ca", function()
                    require("actions-preview").code_actions()
                end, { buffer = bufnr, desc = "LSP: Open Code Actions" })
                vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = bufnr, desc = "Diagnostics: Open Float" })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover" })
                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Diagnostics: Next" })
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Diagnostics: Prev" })
                vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "LSP: Signature Help" })
            end
        })

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "clangd", "pyright", "rust_analyzer" },
            automatic_installation = true,
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({ capabilities = capabilities })
                end,

                ["clangd"] = function()
                    require("lspconfig").clangd.setup({
                        capabilities = capabilities,
                        cmd = {
                            "clangd",
                            "--background-index",
                            "--clang-tidy",
                            "--header-insertion=never",
                            "--malloc-trim",
                            "--all-scopes-completion",
                            "--compile-commands-dir=build",
                            "--suggest-missing-includes=false",
                            "-j=8",
                        },
                        settings = {
                            clangd = {
                                completion = {
                                    enableSnippets = true,
                                },
                            },
                        },
                    })
                end,

                ["pyright"] = function()
                    require("lspconfig").pyright.setup({
                        capabilities = capabilities,
                        settings = {
                            pyright = { autoImportCompletion = true },
                            python = {
                                analysis = {
                                    typeCheckingMode = "basic",
                                    autoSearchPaths = true,
                                    diagnosticMode = "workspace",
                                },
                            },
                        },
                    })
                end,

                ["rust_analyzer"] = function()
                    require("lspconfig").rust_analyzer.setup({
                        capabilities = capabilities,
                        settings = {
                            ["rust-analyzer"] = {
                                completion = {
                                    callable = {
                                        snippets = true,
                                    },
                                },
                            },
                        },
                    })
                end,
            },
        })

        -- Add border to hover + signature help
        local orig_util = vim.lsp.util.open_floating_preview
        vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or "rounded"
            return orig_util(contents, syntax, opts, ...)
        end
    end,
}
