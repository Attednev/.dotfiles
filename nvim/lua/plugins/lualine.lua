return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
        require('lualine').setup({
            options = { theme = 'rose-pine-alt' },
            sections = {
                lualine_c = {
                    {
                        'filename',
                        symbols = {
                            modified = '●',
                            readonly = '',
                        }
                    },
                }
            },
        })
    end
}
