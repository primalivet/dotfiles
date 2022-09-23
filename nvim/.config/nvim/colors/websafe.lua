-- " Websafe
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

vim.g.colors_name = "websafe"

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
reset("LineNr")
reset("LineNrAbove")
reset("LineNrBelow")
reset("ModeMsg")
reset("MoreMsg")
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

set_hl(0, "NormalFloat", { ctermfg = "NONE", ctermbg = white })

set_hl(0, "Pmenu", { ctermfg = "NONE", ctermbg = white })
set_hl(0, "PmenuSbar", { reverse = white })
set_hl(0, "PmenuSel", { reverse = 1 })
set_hl(0, "PmenuThumb", { ctermbg = black })

set_hl(0, "StatusLine", { ctermfg = bright_white, ctermbg = black, bold = 1 })
set_hl(0, "StatusLineNC", { ctermfg = white, ctermbg = black })
set_hl(0, "QuickFixLine", { ctermfg = black, ctermbg = green })

set_hl(0, "VertSplit", { ctermfg = white, ctermbg = black })
set_hl(0, "WinSeparator", { ctermfg = white, ctermbg = black })

set_hl(0, "MatchParen", { ctermfg = black, ctermbg = bright_magenta })

set_hl(0, "ErrorMsg", { ctermfg = bright_white, ctermbg = red })
set_hl(0, "WarningMsg", { ctermfg = black, ctermbg = yellow })

set_hl(0, "Visual", { ctermfg = white, ctermbg = blue })
set_hl(0, "VisualNOS", { ctermfg = white, ctermbg = blue })

set_hl(0, "Search", { ctermfg = white, ctermbg = bright_blue})
set_hl(0, "IncSearch", { ctermfg = white, ctermbg = blue})

set_hl(0, "DiffAdd", { ctermbg = bright_green, ctermfg = black })
set_hl(0, "DiffChange", { ctermbg = bright_yellow, ctermfg = black })
set_hl(0, "DiffDelete", { ctermbg = bright_red, ctermfg = black })
set_hl(0, "DiffText", { ctermbg = yellow, ctermfg = black })


-- Suggested Group names (by Vim, see :h group-name)
set_hl(0, "Comment", { ctermfg = cyan, italic = 1 })
set_hl(0, "Constant", { ctermfg = red })
set_hl(0, "Identifier", { ctermfg = blue })
set_hl(0, "Statement", { ctermfg = green, bold = 1 })
set_hl(0, "PreProc", { ctermfg = "NONE" })
set_hl(0, "Macro", { ctermfg = green })
set_hl(0, "Type", { ctermfg = bright_blue, bold = 1 })
reset("Special")
reset("Ignore")
set_hl(0, "Underlined", { underline = 1 })

set_hl(0,"Error", { ctermfg = red })
set_hl(0, "Todo", { ctermfg = black, ctermbg = bright_yellow })

-- GitSigns (plugin)
set_hl(0, "GitSignsAdd", { ctermfg = bright_green })
set_hl(0, "GitSignsChange", { ctermfg = bright_yellow })
set_hl(0, "GitSignsDelete", { ctermfg = bright_red })
