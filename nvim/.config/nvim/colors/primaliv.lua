vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "primaliv"

local black = "#1c1c1c" -- ANSI: 234  --  HEX:  #1c1c1c  --  same  as  background
local red = "#fd5e00" -- ANSI: 202  --  HEX:  #fd5e00
local green = "#00875f" -- ANSI: 29   --  HEX:  #00875f
local yellow = "#ffd800" -- ANSI: 220  --  HEX:  #ffd800
local blue = "#005faf" -- ANSI: 25   --  HEX:  #005faf
local magenta = "#870087" -- ANSI: 90   --  HEX:  #870087
local cyan = "#00605f" -- ANSI: 23   --  HEX:  #00605f
local white = "#9e9e9e" -- ANSI: 247  --  HEX:  #9e9e9e
local bright_black = "#3a3a3a" -- ANSI: 237  --  HEX:  #3a3a3a
local bright_red = "#ff875f" -- ANSI: 209  --  HEX:  #ff875f
local bright_green = "#01af87" -- ANSI: 36   --  HEX:  #01af87
local bright_yellow = "#ffff5f" -- ANSI: 227  --  HEX:  #ffff5f
local bright_blue = "#01afff" -- ANSI: 39   --  HEX:  #01afff
local bright_magenta = "#875faf" -- ANSI: 97   --  HEX:  #875faf
local bright_cyan = "#008787" -- ANSI: 30   --  HEX:  #008787
local bright_white = "#dadada" -- ANSI: 253  --  HEX:  #dadada  --  same  as  foreground

-- extra colors
local almost_black1 = "#262626" -- ANSI: 235 -- HEX: #303030
local almost_black2 = "#303030" -- ANSI: 236 -- HEX: #303030

local set_hl = vim.api.nvim_set_hl

local reset = function(group)
  vim.api.nvim_set_hl(0, group, { fg = bright_white })
end
local link = function(group, target)
  vim.api.nvim_set_hl(0, group, { link = target })
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
reset("Error")
reset("ErrorMsg")
reset("FoldColumn")
reset("Ignore")
reset("ModeMsg")
reset("MoreMsg")
reset("MsgArea")
reset("MsgSeparator")
reset("Question")
reset("SignColumn")
reset("SpellBad")
reset("SpellCap")
reset("SpellLocal")
reset("SpellRare")
reset("TabLine")
reset("TabLineFill")
reset("TabLineSel")
reset("TermCursor")
reset("TermCursorNC")
reset("Title")
reset("Todo")
reset("Underlined")
reset("VisualNOS")
reset("WarningMsg")
reset("lCursor")

set_hl(0, "WildMenu", { fg = yellow, bg = bright_black, bold = true })

set_hl(0, "DiffAdd", { fg = green })
set_hl(0, "DiffChange", { fg = "none" }) -- TODO: missing definition
set_hl(0, "DiffDelete", { fg = red })
set_hl(0, "DiffText", { fg = blue }) -- TODO: missing definition

set_hl(0, "DiagnosticError", { fg = bright_red })
set_hl(0, "DiagnosticHint", { fg = bright_blue })
set_hl(0, "DiagnosticInfo", { fg = bright_blue })
set_hl(0, "DiagnosticWarn", { fg = bright_yellow })

set_hl(0, "MatchParen", { bg = bright_blue })

set_hl(0, "Visual", { bg = bright_black })

set_hl(0,"QuickFixLine", {  fg = yellow, bg = almost_black2 })

set_hl(0, "Normal", { fg = bright_white, bg = black })
link("NormalNC", "Normal")

set_hl(0, "NormalFloat", { bg = almost_black1 })

link("Pmenu", "StatusLine")
link("PmenuSbar", "StatusLine")
link("PmenuSel", "WildMenu")
set_hl(0, "PmenuThumb", { bg = white })

set_hl(0, "Search", { fg = black, bg = yellow })
link("IncSearch", "Search")
link("Substitute", "Search")

set_hl(0, "Whitespace", { fg = bright_black })
link("NonText", "Whitespace")
link("EndOfBuffer", "Whitespace")
link("SpecialKey", "Whitespace")

set_hl(0, "Folded", { bg = almost_black1 })

set_hl(0, "StatusLine", { fg = bright_white, bg = bright_black })
set_hl(0, "StatusLineNC", { fg = white, bg = almost_black2 })

set_hl(0, "WinSeparator", { fg = almost_black2 })
link("VertSplit", "WinSeparator")

set_hl(0, "LineNr", { fg = yellow })
set_hl(0, "LineNrAbove", { fg = bright_black })
set_hl(0, "LineNrBelow", { fg = bright_black })

-- Syntax

set_hl(0, "Comment", { fg = bright_cyan, italic = true })

link("Constant", "Normal")
set_hl(0, "String", { fg = bright_green })
link("Character", "Constant")
link("Number", "Constant")
set_hl(0, "Boolean", { fg = yellow, bold = true })
link("Float", "Constant")

reset("Identifier")
link("Function", "Identifier")

set_hl(0, "Statement", { fg = yellow, bold = true })
link("Conditional", "Statement")
link("Repeat", "Statement")
link("Label", "Statement")
link("Operator", "Normal")
link("Keyword", "Statement")
link("Exception", "Statement")

reset("PreProc")
link("Include", "PreProc")
link("Define", "PreProc")
link("Macro", "PreProc")
link("PreCondit", "PreProc")

set_hl(0, "Type", { fg = white, italic = true })
link("StorageClass", "Normal")
link("Structure", "Type")
link("Typedef", "Type")

reset("Special")
link("Tag", "Special")
link("Delimiter", "Special")
link("SpecialComment", "Special")
link("Debug", "Special")
-- Plugins

reset("GitSignsAdd")
reset("GitSignsChange")
reset("GitSignsDelete")
reset("TelescopeSelection")
