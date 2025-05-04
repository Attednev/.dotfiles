return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup {}

        vim.keymap.set('n', '<leader>M', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon: Open Quick Menu" })

        vim.keymap.set('n', '<leader>m', function()
            harpoon:list():add()
        end, { desc = "Harpoon: Add Location" })

        vim.keymap.set('n', '<leader>1', function()
            harpoon:list():select(1)
        end, { desc = "Harpoon: Select List Item (1)" })

        vim.keymap.set('n', '<leader>2', function()
            harpoon:list():select(2)
        end, { desc = "Harpoon: Select List Item (2)" })

        vim.keymap.set('n', '<leader>3', function()
            harpoon:list():select(3)
        end, { desc = "Harpoon: Select List Item (3)" })

        vim.keymap.set('n', '<leader>4', function()
            harpoon:list():select(4)
        end, { desc = "Harpoon: Select List Item (4)" })

        vim.keymap.set('n', '<leader>p', function()
            harpoon:list():prev()
        end, { desc = "Harpoon: Select Previous List Item" })

        vim.keymap.set('n', '<leader>n', function()
            harpoon:list():next()
        end, { desc = "Harpoon: Select Next List Item" })
    end,
}
