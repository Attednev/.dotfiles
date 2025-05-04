require("config.set")
require("config.remap")
require("config.lazy_init")

require("lazy").setup({
    require "plugins.actions-preview",
    require "plugins.cmp",
    require "plugins.colorscheme",
    require "plugins.conform",
    require "plugins.dap",
    require "plugins.fugitive",
    require "plugins.harpoon",
    require "plugins.indentline",
    require "plugins.lsp",
    require "plugins.lualine",
    require "plugins.luasnip",
    require "plugins.misc",
    require "plugins.neotest",
    require "plugins.notify",
    require "plugins.nvim-tree",
    require "plugins.statuscol",
    require "plugins.telescope",
    {
        "ThePrimeagen/vim-be-good"
    }
})

require("config.post")
