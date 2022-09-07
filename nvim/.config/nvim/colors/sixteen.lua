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

vim.g.colors_name = "sixteen"

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "sixteen"

local hl = function(group, values)
  vim.api.nvim_set_hl(0, group, values)
end

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
reset("ModeMsg")
reset("MoreMsg")
reset("MsgArea")
reset("MsgSeparator")
reset("NonText")
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

hl("NormalFloat", { ctermfg = "NONE", ctermbg = bright_black })

hl("Pmenu", { ctermfg = "NONE", ctermbg = bright_black })
hl("PmenuSbar", { reverse = bright_black })
hl("PmenuSel", { reverse = 1 })
hl("PmenuThumb", { ctermbg = black })

hl("StatusLine", { ctermfg = black, ctermbg = bright_white, bold = 1 })
hl("StatusLineNC", { ctermfg = black, ctermbg = white })
hl("QuickFixLine", { ctermfg = black, ctermbg = green })

hl("VertSplit", { ctermfg = black, ctermbg = white })
hl("WinSeparator", { ctermfg = black, ctermbg = white })

hl("MatchParen", { ctermfg = black, ctermbg = bright_magenta })

hl("ErrorMsg", { ctermfg = bright_white, ctermbg = bright_red })
hl("WarningMsg", { ctermfg = black, ctermbg = bright_yellow })

hl("Visual", { ctermfg = black, ctermbg = bright_yellow })
hl("VisualNOS", { ctermfg = black, ctermbg = bright_yellow })

hl("Search", { ctermfg = black, ctermbg = bright_yellow })
hl("IncSearch", { ctermfg = black, ctermbg = bright_yellow })

hl("DiffAdd", { ctermfg = black, ctermbg = green })
hl("DiffChange", { ctermfg = black, ctermbg = yellow })
hl("DiffDelete", { ctermfg = black, ctermbg = red })
hl("DiffText", { ctermfg = black, ctermbg = yellow, bold = 1 })

hl("LineNr", { ctermfg = bright_yellow })
hl("LineNrAbove", { ctermfg = bright_yellow })
hl("LineNrBelow", { ctermfg = bright_yellow })

hl("Comment", { ctermfg = cyan })

reset("Constant")
hl("String", { ctermfg = bright_magenta })
hl("Character", { ctermfg = magenta })

reset("Identifier")

hl("Statement", { ctermfg = bright_yellow })

reset("PreProc")

hl("Type", { ctermfg = bright_cyan })

reset("Special")

hl("Underlined", { underline = 1 })

reset("Ignore")

hl("Error", { ctermfg = red })

hl("Todo", { ctermfg = black, ctermbg = bright_yellow })
