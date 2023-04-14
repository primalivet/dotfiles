-- " Gettit
-- " ----------------------------------------------------------------------------
-- " This is opinionated

local black = "#000000"
local red = "#660000"
local green = "#006600"
local yellow = "#666600"
local blue = "#000066"
local magenta = "#660066"
local cyan = "#006666"
local white = "#dddddd"
local bright_black = "#999999"
local bright_red = "#ff0000"
local bright_green = "#00ff00"
local bright_yellow = "#ffff00"
local bright_blue = "#0000ff"
local bright_magenta = "#ff00ff"
local bright_cyan = "#00ffff"
local bright_white = "#ededed"

local extra_bright_red = "#ffdddd"
local extra_bright_green = "#ddffdd"
local extra_bright_yellow = "#ffffdd"
local extra_bright_blue = "#ddeeff"
local extra_bright_magenta = "#ffddff"
local extra_bright_cyan = "#ddffff"

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "gettit"

local set_hl = vim.api.nvim_set_hl
local reset = function(group)
  vim.api.nvim_set_hl(0, group, { fg = black, bg = bright_white })
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
reset("EndOfBuffer")
reset("FoldColumn")
reset("Folded")
reset("ModeMsg")
reset("MoreMsg")
reset("MsgArea")
reset("MsgSeparator")
reset("NonText")
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
reset("LineNr")
reset("LineNrAbove")
reset("LineNrBelow")

set_hl(0, "SignColumn", {})
set_hl(0, "NormalFloat", { fg = "NONE", bg = white })

set_hl(0, "Pmenu", { link = "NormalFloat" })
set_hl(0, "PmenuSbar", {})
set_hl(0, "PmenuSel", { link = "WildMenu" })
set_hl(0, "PmenuThumb", { bg = black })

set_hl(0, "WildMenu", { bg = bright_yellow })

set_hl(0, "StatusLine", { fg = black, bg = bright_white, bold = 1 })
set_hl(0, "StatusLineNC", { fg = black, bg = bright_black })
set_hl(0, "QuickFixLine", { fg = black, bg = green })

set_hl(0, "VertSplit", { fg = black, bg = bright_black })
set_hl(0, "WinSeparator", { fg = black, bg = bright_black })

set_hl(0, "MatchParen", { bold = 1 })

set_hl(0, "ErrorMsg", { fg = bright_white, bg = bright_red })
set_hl(0, "WarningMsg", { fg = black, bg = bright_yellow })

set_hl(0, "Visual", { link = "WildMenu" })
set_hl(0, "VisualNOS", { link = "Visual" })

set_hl(0, "Search", { link = "WildMenu" })
set_hl(0, "IncSearch", { link = "Search" })

set_hl(0, "DiffAdd", { bg = extra_bright_green })
set_hl(0, "DiffChange", {})
set_hl(0, "DiffDelete", { bg = extra_bright_red })
set_hl(0, "DiffText", { bg = extra_bright_blue })

-- Suggested Group names (by Vim, see :h group-name)
set_hl(0, "Comment", { fg = green, italic = 1 })
set_hl(0, "Constant", { fg = red })
set_hl(0, "Identifier", {})
set_hl(0, "Function", { fg = magenta })
set_hl(0, "Statement", { fg = magenta })
set_hl(0, "PreProc", { fg = magenta })
set_hl(0, "Type", { fg = bright_blue })
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
set_hl(0, "DiagnosticVirtualTextError", { fg = red, bg = extra_bright_red, italic = 1 })
set_hl(0, "DiagnosticVirtualTextWarn", { fg = yellow, bg = extra_bright_yellow, italic = 1 })
set_hl(0, "DiagnosticVirtualTextInfo", { fg = blue, bg = extra_bright_blue, italic = 1 })
set_hl(0, "DiagnosticVirtualTextHint", { fg = green, bg = extra_bright_green, italic = 1 })

-- GitSigns (plugin)
set_hl(0, "GitSignsAdd", { fg = green })
set_hl(0, "GitSignsChange", { fg = blue })
set_hl(0, "GitSignsDelete", { fg = red })
