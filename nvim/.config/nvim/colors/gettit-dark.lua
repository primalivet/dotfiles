-- " Gettit
-- " ----------------------------------------------------------------------------
-- " This is opinionated

local bg = "#232323"
local fg = "#ededed"

local black = "#000000"
local red = "#ad1d1d"
local green = "#1dad1d"
local yellow = "#adad1d"
local blue = "#2222cc"
local magenta = "#cc22cc"
local cyan = "#22cccc"
local white = "#aaaaaa"

local bright_black = "#636363"
local bright_red = "#ff5858"
local bright_green = "#58ff58"
local bright_yellow = "#ffff58"
local bright_blue = "#5858aa"
local bright_magenta = "#ff58ff"
local bright_cyan = "#58ffff"
local bright_white = "#ffffff"

local extra_dark_red = "#841717"
local extra_dark_green = "#178417"
local extra_dark_yellow = "#9b9b00"
local extra_dark_blue = "#174e84"
local extra_dark_magenta = "#9b009b"
local extra_dark_cyan = "#009b9b"

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "gettit-dark"

local set_hl = vim.api.nvim_set_hl
local reset = function(group)
  vim.api.nvim_set_hl(0, group, { fg = fg, bg = 'none' })
end

reset("ColorColumn")
reset("Conceal")
reset("Cursor")
reset("CursorColumn")
reset("CursorIM")
reset("CursorLine")
reset("CursorLineFold")
reset("CursorLineNr")
reset("CursorLineSign")
reset("Directory")
reset("FoldColumn")
reset("Folded")
reset("ModeMsg")
reset("MoreMsg")
reset("MsgArea")
reset("MsgSeparator")
reset("Normal")
reset("NormalNC")
reset("Question")
reset("SpecialKey")
reset("SpellBad")
reset("SpellCap")
reset("SpellLocal")
reset("SpellRare")
reset("Substitute")
reset("TabLine")
reset("TabLineFill")
reset("TabLineSel")
reset("TermCursor")
reset("TermCursorNC")
reset("Title")
reset("Whitespace")
reset("lCursor")

set_hl(0, "NonText", { fg = bright_black })
set_hl(0, "EndOfBuffer", { link = "NonText" })

set_hl(0, "LineNr", { fg = bright_black })
set_hl(0, "LineNrAbove", { link = "LineNr" })
set_hl(0, "LineNrBelow", { link = "LineNr" })

set_hl(0, "SignColumn", {})
set_hl(0, "NormalFloat", { fg = "NONE", bg = bright_black })

set_hl(0, "Pmenu", { link = "NormalFloat" })
set_hl(0, "PmenuSbar", {})
set_hl(0, "PmenuSel", { link = "WildMenu" })
set_hl(0, "PmenuThumb", { bg = black })

set_hl(0, "WildMenu", { fg = white, bg = blue })

set_hl(0, "StatusLine", { fg = black, bg = bright_black })
set_hl(0, "StatusLineNC", { fg = black, bg = white })
set_hl(0, "QuickFixLine", { fg = black, bg = green })

set_hl(0, "VertSplit", { fg = white })
set_hl(0, "WinSeparator", { link = "VertSplit" })

set_hl(0, "MatchParen", { bold = 1 })

set_hl(0, "ErrorMsg", { fg = bright_white, bg = bright_red })
set_hl(0, "WarningMsg", { fg = black, bg = bright_yellow })

set_hl(0, "Visual", { bg = extra_dark_yellow })
set_hl(0, "VisualNOS", { link = "Visual" })

set_hl(0, "Search", { link = "WildMenu" })
set_hl(0, "IncSearch", { link = "Search" })

set_hl(0, "DiffAdd", { bg = extra_dark_green })
set_hl(0, "DiffChange", {})
set_hl(0, "DiffDelete", { bg = extra_dark_red })
set_hl(0, "DiffText", { bg = extra_dark_blue })

-- Suggested Group names (by Vim, see :h group-name)
set_hl(0, "Comment", { fg = cyan, italic = 1 })
set_hl(0, "Constant", { fg = red })
set_hl(0, "Identifier", { fg = blue })
set_hl(0, "Function", { fg = "NONE" })
set_hl(0, "Statement", { fg = green, bold = true })
set_hl(0, "PreProc", { fg = green, bold = true })
set_hl(0, "Type", { fg = magenta })
reset("Special")
reset("Ignore")
set_hl(0, "Underlined", { underline = 1 })
set_hl(0, "Error", { fg = red })
set_hl(0, "Todo", { fg = black, bg = bright_yellow })

-- Diagnostics
set_hl(0, "DiagnosticError", { fg = red })
set_hl(0, "DiagnosticWarn", { fg = yellow })
set_hl(0, "DiagnosticInfo", { fg = blue })
set_hl(0, "DiagnosticHint", { fg = blue })
set_hl(0, "DiagnosticVirtualTextError", { fg = red, bg = extra_dark_red, italic = 1 })
set_hl(0, "DiagnosticVirtualTextWarn", { fg = yellow, bg = extra_dark_yellow, italic = 1 })
set_hl(0, "DiagnosticVirtualTextInfo", { fg = blue, bg = extra_dark_blue, italic = 1 })
set_hl(0, "DiagnosticVirtualTextHint", { fg = green, bg = extra_dark_green, italic = 1 })

-- GitSigns (plugin)
set_hl(0, "GitSignsAdd", { fg = green })
set_hl(0, "GitSignsChange", { fg = blue })
set_hl(0, "GitSignsDelete", { fg = red })
