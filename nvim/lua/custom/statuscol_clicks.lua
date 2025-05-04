local M = {}

local function find_breakpoint_on_line(api, buf, line)
    local bps = api.get()
    if not bps then
        vim.notify("No breakpoint on this line to modify.", vim.log.levels.INFO)
        return nil
    end

    local bps_in_buf = bps[buf]
    if not bps_in_buf then
        vim.notify("No breakpoint on this line to modify.", vim.log.levels.INFO)
        return nil
    end

    for _, bp in ipairs(bps_in_buf) do
        if bp.line == line then
            return bp
        end
    end

    vim.notify("No breakpoint on this line to modify.", vim.log.levels.INFO)
    return nil
end

function M.DapModify()
    local buf = vim.api.nvim_get_current_buf()
    local line = vim.api.nvim_win_get_cursor(0)[1]

    local api = require('dap.breakpoints')
    if not api then
        vim.notify("nvim-dap is not loaded", vim.log.levels.WARN)
        return nil
    end

    local bp = find_breakpoint_on_line(api, buf, line)
    if not bp then return end
    if not bp.logMessage and not bp.condition then return end

    local update_breakpoint = function(log, cond)
        if not log and not cond then return end
        api.set({ condition = cond, log_message = log }, buf, line)
    end

    if bp.logMessage then
        vim.ui.input({ prompt = "Log point message: ", default = bp.logMessage or "" }, function(log)
            update_breakpoint(log, nil)
        end)
    elseif bp.condition then
        vim.ui.input({ prompt = "Breakpoint condition: ", default = bp.condition or "" }, function(cond)
            update_breakpoint(nil, cond)
        end)
    end
end

_G.StatuscolClicks = M

return M
