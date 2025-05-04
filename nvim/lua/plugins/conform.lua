return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo", "Format" },
    event = { "BufWritePre" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" }
            },
            formatters = {
                clang_format = {
                    prepend_args = function()
                        local has_local = vim.fn.findfile(".clang-format", vim.fn.getcwd() .. ";") ~= ""
                        if has_local then
                            return { "-style=file" }
                        end
                        local fallback = vim.fn.expand("~/.config/clang-format/custom.clang-format")
                        return { "-style=file:" .. fallback }
                    end,
                },
            },
        })

        local conform_group = vim.api.nvim_create_augroup("ConformFormat", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = conform_group,
            callback = function(args)
                conform.format({ bufnr = args.buf, lsp_fallback = true, async = false })
            end,
        })

        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.range == 1 then
                range = {
                    start = vim.api.nvim_buf_get_lines(args.buf, args.line1 - 1, args.line1, true)[1],
                    stop = vim.api.nvim_buf_get_lines(args.buf, args.line2 - 1, args.line2, true)[1],
                }
            end
            conform.format({ bufnr = args.buf, lsp_fallback = true, async = true, timeout_ms = 1000, range = range })
        end, { nargs = 0, range = true, desc = "Format current buffer or visual selection with conform.nvim" })
    end,
}
