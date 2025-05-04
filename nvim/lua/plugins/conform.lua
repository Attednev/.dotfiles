return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" }
            },
            formatters = {
                clang_format = {
                    prepend_args = {"-style=file:Google"}  -- Use .clang-format config
                },
            },
        })
    end,
}
