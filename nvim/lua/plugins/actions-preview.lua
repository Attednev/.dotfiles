return {
    "aznhe21/actions-preview.nvim",
    lazy = true,
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("actions-preview").setup({
            diff = { ctxlen = 2, },
            backend = { "telescope" },
            telescope = vim.tbl_extend(
                "force",
                require("telescope.themes").get_cursor(),
                {
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.4,
                        height = 0.6,
                        preview_height = 12,
                    },
                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                }
            ),
        })
    end
}
