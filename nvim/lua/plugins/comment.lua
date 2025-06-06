return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<C-/>', require('Comment.api').toggle.linewise.current, opts)
        vim.keymap.set('v', '<C-/>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
    end,
}
