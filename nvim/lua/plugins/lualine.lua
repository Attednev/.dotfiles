return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "Attednev/github-nvim-theme",
    },
    opts = {
        options = {
            section_separators = { left = "", right = "" },
            component_separators = { left = "", right = "" },
            globalstatus = true,
            theme = "github_dark_high_contrast_alt",
        },
        sections = {
            lualine_b = {
                {
                    "filename",
                    symbols = {
                        modified = "●",
                        readonly = "",
                    },
                },
            },
            lualine_c = { "branch" },
            lualine_x = { },
        },
    },
}
