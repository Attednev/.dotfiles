return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash", "c", "lua", "vim", "vimdoc", "python", "json", "markdown"
            },
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true,
                disable = { "python", "yaml" },
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
