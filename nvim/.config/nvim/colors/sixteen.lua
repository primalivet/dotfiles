-- " Sixteen
-- " ----------------------------------------------------------------------------
-- " This is opinionated
-- "
-- " This colorscheme uses the 16 (0-15) ANSI as well as the background and
-- " foreground of your terminal emulator. It only specifies terminal colors so
-- " you shouldn't use "set termguicolors" with this colorscheme. If you do,
-- " colors will fallback to vim/neovim default colorscheme.

local black = 0
local red = 1
local green = 2
local yellow = 3
local blue = 4
local magenta = 5
local cyan = 6
local white = 7
local bright_black = 8
local bright_red = 9
local bright_green = 10
local bright_yellow = 11
local bright_blue = 12
local bright_magenta = 13
local bright_cyan = 14
local bright_white = 15

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "sixteen"

local set_hl = vim.api.nvim_set_hl
local reset = function(group)
  vim.api.nvim_set_hl(0, group, { ctermfg = "NONE", ctermbg = "NONE" })
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
reset("MoreMsg")
reset("ModeMsg")
reset("MsgArea")
reset("MsgSeparator")
reset("Normal")
reset("NormalNC")
reset("Question")
reset("SignColumn")
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
reset("WildMenu")
reset("lCursor")

set_hl(0, "NonText", { ctermfg = bright_black })

set_hl(0, "NormalFloat", { ctermfg = "NONE", ctermbg = bright_black })

set_hl(0, "Pmenu", { ctermfg = "NONE", ctermbg = bright_black })
set_hl(0, "PmenuSbar", { reverse = bright_black })
set_hl(0, "PmenuSel", { reverse = 1 })
set_hl(0, "PmenuThumb", { ctermbg = black })

set_hl(0, "StatusLine", { ctermfg = black, ctermbg = bright_white, bold = 1 })
set_hl(0, "StatusLineNC", { ctermfg = black, ctermbg = bright_black })
set_hl(0, "QuickFixLine", { ctermfg = black, ctermbg = green })

set_hl(0, "VertSplit", { ctermfg = black, ctermbg = bright_black })
set_hl(0, "WinSeparator", { ctermfg = black, ctermbg = bright_black })

set_hl(0, "MatchParen", { ctermfg = black, ctermbg = bright_magenta })

set_hl(0, "ErrorMsg", { ctermfg = bright_white, ctermbg = bright_red })
set_hl(0, "WarningMsg", { ctermfg = black, ctermbg = bright_yellow })

set_hl(0, "Visual", { ctermfg = black, ctermbg = bright_yellow })
set_hl(0, "VisualNOS", { ctermfg = black, ctermbg = bright_yellow })

set_hl(0, "Search", { ctermfg = black, ctermbg = bright_yellow })
set_hl(0, "IncSearch", { ctermfg = black, ctermbg = bright_yellow })

set_hl(0, "DiffAdd", { ctermbg = green, ctermfg = 0 })
set_hl(0, "DiffChange", { ctermbg = yellow, ctermfg = 0 })
set_hl(0, "DiffDelete", { ctermbg = red, ctermfg = 0 })
set_hl(0, "DiffText", { ctermbg = yellow, ctermfg = 0, underline = 1 })

set_hl(0, "LineNr", { ctermfg = bright_yellow })
set_hl(0, "LineNrAbove", { ctermfg = bright_yellow })
set_hl(0, "LineNrBelow", { ctermfg = bright_yellow })

-- Suggested Group names (by Vim, see :h group-name)
set_hl(0, "Comment", { ctermfg = cyan, italic = 1 })
set_hl(0, "Constant", { ctermfg = bright_magenta })
set_hl(0, "Identifier", { bold = 1 })
set_hl(0, "Statement", { ctermfg = bright_yellow, bold = 1 })
set_hl(0, "PreProc", { ctermfg = bright_blue })
set_hl(0, "Type", { ctermfg = bright_cyan })
reset("Special")
reset("Ignore")
set_hl(0, "Underlined", { underline = 1 })
set_hl(0, "Error", { ctermfg = red })
set_hl(0, "Todo", { ctermfg = black, ctermbg = bright_yellow })

-- GitSigns (plugin)
set_hl(0, "GitSignsAdd", { ctermfg = green })
set_hl(0, "GitSignsChange", { ctermfg = yellow })
set_hl(0, "GitSignsDelete", { ctermfg = red })
