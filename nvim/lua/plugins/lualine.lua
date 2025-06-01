return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local palette = require('github-theme.palette').load('github_dark_high_contrast')

        local colors = {
            background          = palette['black']['base'],
            foreground          = palette['fg']['default'],
            red                 = palette['scale']['red'][6],
            pink                = palette['scale']['pink'][7],
            orange              = palette['scale']['orange'][6],
            blue                = palette['blue']['base'],
            gray                = palette['scale']['gray'][5],
            inactive_gray       = palette['fg']['subtle'],
            background_active   = palette['canvas']['overlay'],
        }

        require('lualine').setup({
            options = {
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                theme = {
                    normal = {
                        a = { bg = colors.background,        fg = colors.blue, gui = 'bold' },
                        b = { bg = colors.background_active, fg = colors.foreground },
                        c = { bg = colors.background_active, fg = colors.inactive_gray, gui = 'italic' }
                    },
                    insert = {
                        a = { bg = colors.background,        fg = colors.red, gui = 'bold' },
                        b = { bg = colors.background_active, fg = colors.foreground },
                        c = { bg = colors.background_active, fg = colors.inactive_gray, gui = 'italic' }
                    },
                    visual = {
                        a = { bg = colors.background,        fg = colors.pink, gui = 'bold' },
                        b = { bg = colors.background_active, fg = colors.foreground },
                        c = { bg = colors.background_active, fg = colors.inactive_gray, gui = 'italic' }
                    },
                    replace = {
                        a = { bg = colors.background,        fg = colors.orange, gui = 'bold' },
                        b = { bg = colors.background_active, fg = colors.foreground },
                        c = { bg = colors.background_active, fg = colors.inactive_gray, gui = 'italic' }
                    },
                    command = {
                        a = { bg = colors.background,        fg = colors.gray, gui = 'bold' },
                        b = { bg = colors.background_active, fg = colors.foreground },
                        c = { bg = colors.background_active, fg = colors.inactive_gray, gui = 'italic' }
                    },
                    inactive = {
                        a = { bg = colors.black, fg = colors.inactive_gray, gui = 'bold' },
                        b = { bg = colors.black, fg = colors.inactive_gray },
                        c = { bg = colors.black, fg = colors.inactive_gray, gui = 'italic' }
                    }
                }
            },
            sections = {
                lualine_c = {
                    {
                        'filename',
                        symbols = {
                            modified = '●',
                            readonly = '',
                        },
                    },
                },
                lualine_x = { 'encoding' },
            },
        })
    end
}
