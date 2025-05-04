
local set = vim.api.nvim_set_hl

local M = {}

function M.apply()
    vim.api.nvim_set_hl(0, "Pmenu", { link = "Comment" })
    vim.api.nvim_set_hl(0, "PmenuSel", { link = "CursorLine" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "NONE" })

    vim.api.nvim_set_hl(0, "DapStopped", { fg = "#FFA500" })
    vim.api.nvim_set_hl(0, "DapBreakpointText", { fg = "#FF5555", bold = true })

    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#FF5555" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#FF5555", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#E2C08D" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#E2C08D", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#61AFEF" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#61AFEF", italic = true })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#DCDCAA" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#DCDCAA" })

    vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "Comment" })
    vim.api.nvim_set_hl(0, "CmpItemAbbr", { link = "Normal" })

    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { link = "Comment" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { link = "Type" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "Type" })
    vim.api.nvim_set_hl(0, "CmpItemKind", { link = "Normal" })
    vim.api.nvim_set_hl(0, "CmpPmenuSel", { link = "PmenuSel" })
    vim.api.nvim_set_hl(0, "CmpPmenuBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "CmpDocumentation", { link = "NormalFloat" })
    vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { link = "FloatBorder" })

    vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Type" })

    vim.api.nvim_set_hl(0, "IncSearch", { fg = "#000000", bg = "#e2c08d", bold = true })

    vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { link = "Type", bold = true })
end

return M
