require("config.set")
require("config.remap")
require("config.lazy_init")

require("lazy").setup({
    require 'plugins.telescope',
    require 'plugins.cmp',
    require 'plugins.colorscheme',
    require 'plugins.comment',
    require 'plugins.conform',
    require 'plugins.dap',
    require 'plugins.harpoon',
    require 'plugins.gitsigns',
    require 'plugins.illuminate',
    require 'plugins.indentlines',
    require 'plugins.fugitive',
    require 'plugins.lsp',
    require 'plugins.lualine',
    require 'plugins.luasnip',
    require 'plugins.notify',
    require 'plugins.filetree',
    require 'plugins.sleuth',
    require 'plugins.surround',
    require 'plugins.treesitter',
    require 'plugins.trouble',
    require 'plugins.undotree',
    require 'plugins.zen',
    {
        'ThePrimeagen/vim-be-good'
    }
})

require("config.post")
