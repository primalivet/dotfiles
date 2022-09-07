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

hl("Normal", { ctermfg = white, ctermbg = black })
hl("NormalNC", { ctermfg = white, ctermbg = black })

hl("ColorColumn", { ctermfg = white, ctermbg = black })
hl("Conceal", { ctermfg = white, ctermbg = black })
hl("Cursor", { ctermfg = white, ctermbg = black })
hl("CursorColumn", { ctermfg = white, ctermbg = black })
hl("CursorIM", { ctermfg = white, ctermbg = black })
hl("CursorLine", { ctermfg = white, ctermbg = black })
hl("CursorLineFold", { ctermfg = white, ctermbg = black })
hl("CursorLineNr", { ctermfg = white, ctermbg = black })
hl("CursorLineSign", { ctermfg = white, ctermbg = black })
hl("Directory", { ctermfg = white, ctermbg = black })
hl("EndOfBuffer", { ctermfg = white, ctermbg = black })
hl("FoldColumn", { ctermfg = white, ctermbg = black })
hl("Folded", { ctermfg = white, ctermbg = black })
hl("ModeMsg", { ctermfg = white, ctermbg = black })
hl("MoreMsg", { ctermfg = white, ctermbg = black })
hl("MsgArea", { ctermfg = white, ctermbg = black })
hl("MsgSeparator", { ctermfg = white, ctermbg = black })
hl("NonText", { ctermfg = white, ctermbg = black })
hl("Question", { ctermfg = white, ctermbg = black })
hl("SignColumn", { ctermfg = white, ctermbg = "NONE" })
hl("SpecialKey", { ctermfg = white, ctermbg = black })
hl("SpellBad", { ctermfg = white, ctermbg = black })
hl("SpellCap", { ctermfg = white, ctermbg = black })
hl("SpellLocal", { ctermfg = white, ctermbg = black })
hl("SpellRare", { ctermfg = white, ctermbg = black })
hl("Substitute", { ctermfg = white, ctermbg = black })
hl("TabLine", { ctermfg = white, ctermbg = black })
hl("TabLineFill", { ctermfg = white, ctermbg = black })
hl("TabLineSel", { ctermfg = white, ctermbg = black })
hl("TermCursor", { ctermfg = white, ctermbg = black })
hl("TermCursorNC", { ctermfg = white, ctermbg = black })
hl("Title", { ctermfg = white, ctermbg = black })
hl("Whitespace", { ctermfg = white, ctermbg = black })
hl("WildMenu", { ctermfg = white, ctermbg = black })
hl("lCursor", { ctermfg = white, ctermbg = black })

hl("NormalFloat", { ctermfg = "NONE", ctermbg = bright_black })

hl("Pmenu", { ctermfg = "NONE", ctermbg = bright_black })
hl("PmenuSbar", { reverse = bright_black })
hl("PmenuSel", { reverse = 1 })
hl("PmenuThumb", { ctermbg = black })

hl("StatusLine", { ctermfg = black, ctermbg = white, bold = 1 })
hl("StatusLineNC", { ctermfg = black, ctermbg = bright_black })
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

hl("Constant", { ctermfg = white })
hl("String", { ctermfg = bright_magenta })
hl("Character", { ctermfg = magenta })

hl("Identifier", { ctermfg = white })

hl("Statement", { ctermfg = bright_yellow })

hl("PreProc", { ctermfg = white })

hl("Type", { ctermfg = bright_cyan })

hl("Special", { ctermfg = white })

hl("Underlined", { underline = 1 })

hl("Ignore", { ctermfg = white })

hl("Error", { ctermfg = red })

hl("Todo", { ctermfg = black, ctermbg = bright_yellow })
