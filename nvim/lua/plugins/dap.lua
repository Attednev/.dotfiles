return {
    "mfussenegger/nvim-dap",
    cmd = {
        "DapContinue",
        "DapToggleBreakpoint",
        "DapSetBreakpoint",
        "DapStepOver",
        "DapStepInto",
        "DapTerminate",
        "DapUIOpen",
        "DapUIClose",
        "DapUIToggle",
        "DapVirtualTextEnable",
        "DapVirtualTextDisable",
    },
    keys = {
        { "<F10>", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "Debug: Log Point" },
        { "<F9>", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Debug: Conditional Breakpoint" },
        { "<F8>", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
        { "<F7>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
        { "<F6>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
        { "<F5>", function() require("dap").continue() end, desc = "Debug: Continue" },
        { "<F3>", function() require("dap").restart() end, desc = "Debug: Restart" },
        { "<F2>", function() require("dap").terminate() end, desc = "Debug: Terminate" },
    },
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local mason_dap = require("mason-nvim-dap")
        local dap_vt = require("nvim-dap-virtual-text")

        local set_sign = function(s, t, thl)
            vim.fn.sign_define(s, { text = t, texthl = thl })
        end
        set_sign("DapBreakpoint", "󰐑", "DapBreakpointText")
        set_sign("DapBreakpointCondition", "󰐒", "DapBreakpointText")
        set_sign("DapStopped", "❯", "DapStopped")
        set_sign("DapBreakpointRejected", "󰐓", "DapBreakpointText")
        set_sign("DapLogPoint", "󰤀", "DapBreakpointText")

        dapui.setup({
            layouts = {
                {
                    elements = {
                        { id = "repl", size = 0.3 },
                        { id = "console", size = 0.4 },
                        { id = "stacks", size = 0.3 },
                    },
                    position = "bottom",
                    size = math.floor(vim.o.lines * 0.182 + 0.5)
                },
                {
                    elements = {
                        { id = "scopes", size = 0.75 },
                        { id = "watches", size = 0.25 },
                    },
                    position = "left",
                    size = math.floor(vim.o.columns * 0.295 + 0.5)
                },
            },
            controls = {
                element = "console",
                enabled = true,
            },
        })

        dap_vt.setup({ virt_text_win_col = 80, })

        mason_dap.setup({
            ensure_installed = { "codelldb" },
            automatic_installation = true,
            handlers = {
                function(config) mason_dap.default_setup(config) end,
            },
        })

        dap.adapters.lldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = vim.fn.exepath("codelldb"),
                args = { "--port", "${port}" },
            },
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
            },
        }

        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() require("dapui").close() end
        dap.listeners.before.event_exited.dapui_config = function() require("dapui").close() end

        local original_signcolumn = vim.o.signcolumn
        local debugger_state = vim.api.nvim_create_augroup("DapUiDebuggerState", { clear = true }),
        vim.api.nvim_create_autocmd("User", {
            group = debugger_state,
            pattern = "DapProgressUpdate",
            callback = function()
                local dap = require("dap")
                local status = dap.status()

                local gitsigns_enabled = vim.fn.exists(":Gitsigns") ~= 0
                local diagnostics_enabled = vim.diagnostic and vim.diagnostic.config

                local debugger_starting = status:find("Starting adapter")
                local debugger_closing = status:find("Closed session")

                if debugger_starting then
                    if gitsigns_enabled then
                        vim.cmd("Gitsigns toggle_signs false")
                    end
                    if diagnostics_enabled then
                        vim.diagnostic.config({ virtual_text = false })
                    end
                    if not original_signcolumn then
                        original_signcolumn = vim.o.signcolumn
                    end
                    vim.o.signcolumn = "yes:1"
                elseif debugger_closing then
                    if gitsigns_enabled then
                        vim.cmd("Gitsigns toggle_signs true")
                    end
                    if diagnostics_enabled then
                        vim.diagnostic.config({ virtual_text = true })
                    end
                    if original_signcolumn then
                        vim.o.signcolumn = original_signcolumn
                    else
                        vim.o.signcolumn = "auto"
                    end
                end
            end,
            desc = "Toggle Gitsigns and diagnostic virtual text on DAP session start/exit",
        })
    end,
}

