vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

if vim.opt.termguicolors:get() then
  print('Colorscheme "Sixteen" should be used without option \'termguicolors')
end

vim.opt.termguicolors = false
vim.g.colors_name = "sixteen"

local black = 0
local red = 1
local green = 2
local yellow = 3
local blue = 4
-- local magenta = 5
-- local cyan = 6
local white = 7
local bright_black = 8
local bright_red = 9
local bright_green = 10
local bright_yellow = 11
local bright_blue = 12
-- local bright_magenta = 13
local bright_cyan = 14
local bright_white = 15

-- extra colors (Cheating)
local almost_black1 = 235
local almost_black2 = 236

local set_hl = vim.api.nvim_set_hl

local reset = function(group)
  vim.api.nvim_set_hl(0, group, { ctermfg = bright_white })
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
reset("TermCursor")
reset("TermCursorNC")
reset("Title")
reset("Todo")
reset("Underlined")
reset("VisualNOS")
reset("WarningMsg")
reset("lCursor")

set_hl(0, "TabLine", { ctermfg = white, ctermbg = almost_black1 })
set_hl(0, "TabLineFill", { ctermbg = almost_black1 })
reset("TabLineSel")

set_hl(0, "CursorLine", { underline = true })

set_hl(0, "WildMenu", { ctermfg = yellow, ctermbg = bright_black, bold = true })

set_hl(0, "DiffAdd", { ctermfg = green })
set_hl(0, "DiffChange", { ctermfg = "none" }) -- TODO: missing definition
set_hl(0, "DiffDelete", { ctermfg = red })
set_hl(0, "DiffText", { ctermfg = blue }) -- TODO: missing definition

set_hl(0, "DiagnosticError", { ctermfg = bright_red })
set_hl(0, "DiagnosticHint", { ctermfg = bright_blue })
set_hl(0, "DiagnosticInfo", { ctermfg = bright_blue })
set_hl(0, "DiagnosticWarn", { ctermfg = bright_yellow })

set_hl(0, "MatchParen", { ctermbg = bright_blue })

set_hl(0, "Visual", { ctermbg = bright_black })

set_hl(0, "QuickFixLine", { ctermfg = yellow, ctermbg = almost_black2 })

set_hl(0, "Normal", { ctermfg = bright_white, ctermbg = black })
link("NormalNC", "Normal")

set_hl(0, "NormalFloat", { ctermbg = almost_black1 })

link("Pmenu", "StatusLine")
link("PmenuSbar", "StatusLine")
link("PmenuSel", "WildMenu")
set_hl(0, "PmenuThumb", { ctermbg = white })

set_hl(0, "Search", { ctermfg = black, ctermbg = yellow })
link("IncSearch", "Search")
link("Substitute", "Search")

set_hl(0, "Whitespace", { ctermfg = bright_black })
link("NonText", "Whitespace")
link("EndOfBuffer", "Whitespace")
link("SpecialKey", "Whitespace")

set_hl(0, "Folded", { ctermbg = almost_black1 })

set_hl(0, "StatusLine", { ctermfg = bright_white, ctermbg = bright_black })
set_hl(0, "StatusLineNC", { ctermfg = white, ctermbg = almost_black2 })

set_hl(0, "WinSeparator", { ctermfg = almost_black2 })
link("VertSplit", "WinSeparator")

set_hl(0, "LineNr", { ctermfg = bright_black })
set_hl(0, "CursorLineNr", { ctermfg = white })
set_hl(0, "LineNrAbove", { ctermfg = bright_black })
set_hl(0, "LineNrBelow", { ctermfg = bright_black })

-- Syntax

set_hl(0, "Comment", { ctermfg = bright_cyan, italic = true })

link("Constant", "Normal")
set_hl(0, "String", { ctermfg = bright_green })
set_hl(0, "Character", { ctermfg = green })
link("Number", "Constant")
set_hl(0, "Boolean", { ctermfg = yellow, bold = true })
link("Float", "Constant")

reset("Identifier")
link("Function", "Identifier")

set_hl(0, "Statement", { ctermfg = yellow, bold = true })
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

set_hl(0, "Type", { ctermfg = white, italic = true })
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

link("HarpoonWindow", "NormalFloat")
