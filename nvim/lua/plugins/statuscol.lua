return {
    "luukvbaal/statuscol.nvim",
    config = function()
        require("custom.statuscol_clicks")

        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
            segments = {
                { sign = { namespace = { "gitsigns" }, maxwidth = 1, }, },
                {
                    sign = {
                        name = { "Dap" },
                        maxwidth = 1,
                        auto = true
                    },
                    click = "v:lua.StatuscolClicks.DapModify"
                },
                { text = { " %l " }, },
            }
        })
    end,
}
