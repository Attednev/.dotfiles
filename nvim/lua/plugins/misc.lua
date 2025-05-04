return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {},
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {
            sign_priority = 50,
        },
    },

    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        opts = {},
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    {
        "kylechui/nvim-surround",
        version = "^3.0.0",
        event = "VeryLazy",
        opts = {},
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true, },
            { "nvim-treesitter/nvim-treesitter-context", lazy = true, },
        },
        opts = {
            ensure_installed = {
                "bash", "c", "lua", "vim", "vimdoc", "python", "json", "markdown", "markdown_inline"
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
        },
    },

    {
        "folke/trouble.nvim",
        keys = {
            { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble: Toggle Diagnostics" },
            { "<leader>tr", "<cmd>Trouble lsp_references<cr>", desc = "Trouble: LSP References" },
            { "<leader>td", "<cmd>Trouble lsp_definitions<cr>", desc = "Trouble: LSP Definitions" },
        },
        opts = {},
    },

    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "UndoTree: Toggle" }
        },
    },

    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
    },

    {
        "tpope/vim-sleuth",
        event = { "BufReadPost", "BufNewFile" },
    },

    {
        "folke/zen-mode.nvim",
        keys = {
            { "<leader>zz", function() require("zen-mode").toggle() end, desc = "Zen Mode: Toggle", noremap = true, silent = true, },
        },
        opts = {
            window = {
                width = 90,
                options = { signcolumn = "yes" },
            },
            plugins = {
                gitsigns = { enabled = true },
            },
        },
        config = function() end
    },
}
