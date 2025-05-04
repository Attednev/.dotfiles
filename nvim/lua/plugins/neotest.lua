return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "rouge8/neotest-rust",
        "nvim-neotest/neotest-python",
    },
    keys = {
        { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Neotest: Toggle Summary" },
        { "<leader>tn", function() require("neotest").run.run() end, desc = "Neotest: Run Nearest Test" },
        { "<leader>tD", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Neotest: Debug Nearest Test" },
        { "<leader>to", function() require("neotest").output.open() end, desc = "Neotest: Open Test Output" },
        { "<leader>ta", function() require("neotest").run.run({ suite = true }) end, desc = "Neotest: Run All Tests" },
        { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Neotest: Run Current File Tests" },
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-rust")({
                    dap_adapter = "lldb",
                    args = { "--no-capture" },
                }),
                require("neotest-python")({
                    dap = { justMyCode = false },
                    args = { "--log-level", "DEBUG" },
                    runner = "pytest",
                }),
            },
            output = {
                enabled = true,
                open_on_run = true,
            },
        })
    end
}
