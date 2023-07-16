local utils = require("utils")

local is_dark = utils.is_dark_mode()

local black = 0
local red = 1
local green = 2
local yellow = 3
local blue = 4
local magenta = 5
local cyan = 6
local bright_grey = 7

local grey = 8
local bright_red = 9
local bright_green = 10
local bright_yellow = 11
local bright_blue = 12
local bright_magenta = 13
local bright_cyan = 14
local white = 15

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.opt.termguicolors = false

vim.g.colors_name = "monochrome"

local set_hl = vim.api.nvim_set_hl
local reset = function(group)
  vim.api.nvim_set_hl(0, group, { fg = is_dark and white or black, bg = "none" })
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
reset("VertSplit")
reset("SignColumn")
reset("NonText")
reset("EndOfBuffer")

set_hl(0, "Folded", { ctermfg = is_dark and bright_grey or grey })

set_hl(0, "LineNr", { ctermfg = is_dark and bright_grey or grey })
set_hl(0, "LineNrAbove", { link = "LineNr" })
set_hl(0, "LineNrBelow", { link = "LineNr" })

set_hl(0, "NormalFloat", { ctermfg = "NONE", ctermbg = is_dark and grey or bright_grey })

set_hl(0, "Pmenu", { link = "NormalFloat" })
set_hl(0, "PmenuSbar", { link = "NormalFloat" })
set_hl(0, "PmenuSel", { link = "WildMenu" })
set_hl(0, "WinSeparator", { link = "VertSplit" })

set_hl(0, "PmenuThumb", { reverse = true })

set_hl(0, "WildMenu", { bold = true, reverse = true })

set_hl(0, "StatusLine", { bold = true, reverse = true })
set_hl(0, "StatusLineNC", { reverse = true })
set_hl(0, "QuickFixLine", { bold = true, ctermbg = is_dark and bright_green or green })

set_hl(0, "MatchParen", { bold = 1 })

set_hl(0, "ErrorMsg", { ctermfg = white, ctermbg = is_dark and bright_red or red })
set_hl(0, "WarningMsg", { ctermfg = black, ctermbg = is_dark and bright_yellow or yellow })

set_hl(0, "Visual", { ctermbg = is_dark and grey or bright_grey })
set_hl(0, "VisualNOS", { link = "Visual" })

set_hl(0, "Search", { ctermfg = black, ctermbg = is_dark and bright_yellow or yellow })
set_hl(0, "IncSearch", { link = "Search" })

set_hl(0, "DiffAdd", { ctermbg = is_dark and green or bright_green })
set_hl(0, "DiffChange", {})
set_hl(0, "DiffDelete", { ctermbg = is_dark and red or bright_red })
set_hl(0, "DiffText", { ctermbg = is_dark and blue or bright_blue })

-- Suggested Group names (by Vim, see :h group-name)
set_hl(0, "Comment", { ctermfg = is_dark and bright_grey or grey, italic = true })
set_hl(0, "Constant", { link = "Normal" })
set_hl(0, "String", { ctermfg = is_dark and bright_grey or grey })
set_hl(0, "Identifier", { link = "Normal" })
set_hl(0, "Statement", { bold = true })
set_hl(0, "PreProc", { italic = true })
set_hl(0, "Type", { bold = true, italic = true })
set_hl(0, "Special", { link = "Normal" })
set_hl(0, "Tag", { bold = true })
set_hl(0, "Ignore", { bold = true })
set_hl(0, "Underlined", { underline = 1 })
set_hl(0, "Error", { ctermfg = is_dark and bright_red or red })
set_hl(0, "Todo", { ctermfg = black, ctermbg = is_dark and bright_yellow or yellow })

-- Diagnostics
set_hl(0, "DiagnosticError", { ctermfg = is_dark and bright_red or red })
set_hl(0, "DiagnosticWarn", { ctermfg = is_dark and bright_yellow or yellow })
set_hl(0, "DiagnosticInfo", { ctermfg = is_dark and bright_blue or blue })
set_hl(0, "DiagnosticHint", { ctermfg = is_dark and bright_blue or blue })

-- GitSigns
set_hl(0, "GitSignsAdd", { ctermfg = is_dark and bright_green or green })
set_hl(0, "GitSignsChange", { ctermfg = is_dark and bright_blue or blue })
set_hl(0, "GitSignsDelete", { ctermfg = is_dark and bright_red or red })

-- Treesitter
set_hl(0, "@function.call", { bold = true })
set_hl(0, "@method.call", { bold = true })
set_hl(0, "@constant.builtin", { bold = true })

-- Telescope
set_hl(0, "TelescopeSelection", { reverse = true })
