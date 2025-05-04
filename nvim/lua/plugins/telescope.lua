return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require('telescope.builtin')
        local actions = require 'telescope.actions'

        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                    },
                }
            }
        })

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
        vim.keymap.set("n", "<leader>fs", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Grep String"})
        vim.keymap.set("n", "<leader>fw", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "Grep String (cword)" })
        vim.keymap.set("n", "<leader>fW", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "Grep String (cWORD)" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
    end
}
