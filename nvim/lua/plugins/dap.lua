return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        opts = {},
        config = function()
            local dap = require("dap")

            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointCondition", { text = "C", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "➔", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })

            vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#FF0000" })
            vim.api.nvim_set_hl(0, "DapStopped", { fg = "#FFA500" })
            vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2E3440" })

            vim.keymap.set("n", "<F10>", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "Debug: Set Conditional Breakpoint" })
            vim.keymap.set("n", "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
            vim.keymap.set("n", "<F8>", function() require("dap").step_over() end, { desc = "Debug: Step Over" })
            vim.keymap.set("n", "<F7>", function() require("dap").step_into() end, { desc = "Debug: Step Into" })
            vim.keymap.set("n", "<F5>", function() require("dap").continue() end, { desc = "Debug: Continue" })
        end,
    },

    {
        "rcarriga/nvim-dap-ui", 
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        opts = {
            layouts = {
                {
                    elements = {
                        {
                            id = "console",
                            size = 0.3
                        }, {
                            id = "scopes",
                            size = 0.7
                        } 
                    },
                    position = "bottom",
                    size = 10
                }, {
                    elements = {
                        {
                            id = "repl",
                            size = 0.0
                        }, {
                            id = "watches",
                            size = 1.0
                        }
                    },
                    position = "left",
                    size = 30
                }
            },

        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            
            dap.listeners.before.attach.dapui_config = function() require("dapui").open() end
            dap.listeners.before.launch.dapui_config = function() require("dapui").open() end
            dap.listeners.before.event_terminated.dapui_config = function() require("dapui").close() end
            dap.listeners.before.event_exited.dapui_config = function() require("dapui").close() end
        end,
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        event = "VeryLazy",
        opts = {
            virt_text_win_col = 80,
        },
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "codelldb",
                },
                automatic_installation = true,
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end,
                },
            })

            local dap = require("dap")
            dap.adapters.lldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = vim.fn.exepath("codelldb"),
                    args = { "--port", "${port}" },
                }
            }
            dap.configurations.c = {
                {
                    name = "Launch Program",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    args = {},
                }
            }
        end,
    },
}

