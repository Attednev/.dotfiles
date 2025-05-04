return { 
    "rcarriga/nvim-dap-ui", 
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
    },
    event = "VeryLazy",
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
    }
}
