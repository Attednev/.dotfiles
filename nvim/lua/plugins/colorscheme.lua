return {
    "Attednev/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
        require("github-theme").setup({
            options = {
                transparent = true
            }
        })

        vim.cmd("colorscheme github_dark_high_contrast")
        require("colors.highlights").apply()
    end,
}
