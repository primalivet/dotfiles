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

if vim.opt.termguicolors:get() then
  print('Colorscheme "Sixteen" should be used without option \'termguicolors')
end

vim.g.colors_name = "sixteen"

local set_hl = vim.api.nvim_set_hl
local reset = function(group)
  vim.api.nvim_set_hl(0, group, { ctermfg = "NONE", ctermbg = "NONE" })
end

local is_dark = vim.opt.background:get() == "dark"

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

set_hl(0, "SignColumn", { ctermbg = is_dark and bright_black or white })
set_hl(0, "NormalFloat", { ctermfg = "NONE", ctermbg = is_dark and bright_black or white })

set_hl(0, "Pmenu", { link = "NormalFloat" })
set_hl(0, "PmenuSbar", {})
set_hl(0, "PmenuSel", { link = "WildMenu" })
set_hl(0, "PmenuThumb", { ctermbg = black })

set_hl(0, "WildMenu", { ctermfg = is_dark and black or bright_white, ctermbg = is_dark and bright_yellow or blue })

set_hl(0, "StatusLine", { ctermfg = black, ctermbg = bright_white, bold = 1 })
set_hl(0, "StatusLineNC", { ctermfg = black, ctermbg = bright_black })
set_hl(0, "QuickFixLine", { ctermfg = black, ctermbg = green })

set_hl(0, "VertSplit", { ctermfg = black, ctermbg = bright_black })
set_hl(0, "WinSeparator", { ctermfg = black, ctermbg = bright_black })

set_hl(0, "MatchParen", { bold = 1 })

set_hl(0, "ErrorMsg", { ctermfg = bright_white, ctermbg = bright_red })
set_hl(0, "WarningMsg", { ctermfg = black, ctermbg = bright_yellow })

set_hl(0, "Visual", { link = "WildMenu" })
set_hl(0, "VisualNOS", { link = "Visual" })

set_hl(0, "Search", { link = "WildMenu" })
set_hl(0, "IncSearch", { link = "Search" })

set_hl(0, "DiffAdd", { ctermbg = green, ctermfg = 0 })
set_hl(0, "DiffChange", {})
set_hl(0, "DiffDelete", { ctermbg = red, ctermfg = 0 })
set_hl(0, "DiffText", { ctermbg = blue, ctermfg = 0, underline = 1 })

set_hl(0, "LineNr", { ctermfg = is_dark and bright_yellow or blue })
set_hl(0, "LineNrAbove", { link = "LineNr" })
set_hl(0, "LineNrBelow", { link = "LineNr" })

-- Suggested Group names (by Vim, see :h group-name)
set_hl(0, "Comment", { ctermfg = is_dark and cyan or green, italic = 1 })
set_hl(0, "Constant", { ctermfg = is_dark and bright_magenta or red })
set_hl(0, "Identifier", { bold = 1 })
set_hl(0, "Statement", { ctermfg = is_dark and bright_yellow or blue, bold = 1 })
set_hl(0, "PreProc", { bold = 1})
set_hl(0, "Type", { ctermfg = is_dark and bright_cyan or bright_blue })
reset("Special")
reset("Ignore")
set_hl(0, "Underlined", { underline = 1 })
set_hl(0, "Error", { ctermfg = red })
set_hl(0, "Todo", { ctermfg = black, ctermbg = bright_yellow })

-- Diagnostics
set_hl(0, "DiagnosticError", { ctermfg = bright_red })
set_hl(0, "DiagnosticWarn", { ctermfg = bright_yellow })
set_hl(0, "DiagnosticInfo", { ctermfg = bright_blue })
set_hl(0, "DiagnosticHint", { ctermfg = bright_blue })
set_hl(0, "DiagnosticVirtualTextError", { ctermfg = bright_red, italic = 1 })
set_hl(0, "DiagnosticVirtualTextWarn", { ctermfg = bright_yellow, italic = 1 })
set_hl(0, "DiagnosticVirtualTextInfo", { ctermfg = bright_blue, italic = 1 })
set_hl(0, "DiagnosticVirtualTextHint", { ctermfg = bright_blue, italic = 1 })

-- GitSigns (plugin)
set_hl(0, "GitSignsAdd", { ctermfg = green })
set_hl(0, "GitSignsChange", { ctermfg = blue })
set_hl(0, "GitSignsDelete", { ctermfg = red })

-- TelescopeBorder xxx links to TelescopeNormal
-- TelescopeMatching xxx links to Special
-- TelescopeMultiIcon xxx links to Identifier
-- TelescopeMultiSelection xxx links to Type
-- TelescopeNormal xxx links to Normal
-- TelescopePreviewBlock xxx links to Constant
-- TelescopePreviewBorder xxx links to TelescopeBorder
-- TelescopePreviewCharDev xxx links to Constant
-- TelescopePreviewDate xxx links to Directory
-- TelescopePreviewDirectory xxx links to Directory
-- TelescopePreviewExecute xxx links to String
-- TelescopePreviewGroup xxx links to Constant
-- TelescopePreviewHyphen xxx links to NonText
-- TelescopePreviewLine xxx links to Visual
-- TelescopePreviewLink xxx links to Special
-- TelescopePreviewMatch xxx links to Search
-- TelescopePreviewMessage xxx links to TelescopePreviewNormal
-- TelescopePreviewMessageFillchar xxx links to TelescopePreviewMessage
-- TelescopePreviewNormal xxx links to TelescopeNormal
-- TelescopePreviewPipe xxx links to Constant
-- TelescopePreviewRead xxx links to Constant
-- TelescopePreviewSize xxx links to String
-- TelescopePreviewSocket xxx links to Statement
-- TelescopePreviewSticky xxx links to Keyword
-- TelescopePreviewTitle xxx links to TelescopeTitle
-- TelescopePreviewUser xxx links to Constant
-- TelescopePreviewWrite xxx links to Statement
-- TelescopePromptBorder xxx links to TelescopeBorder
-- TelescopePromptCounter xxx links to NonText
-- TelescopePromptNormal xxx links to TelescopeNormal
-- TelescopePromptPrefix xxx links to Identifier
-- TelescopePromptTitle xxx links to TelescopeTitle
-- TelescopeResultsBorder xxx links to TelescopeBorder
-- TelescopeResultsClass xxx links to Function
-- TelescopeResultsComment xxx links to Comment
-- TelescopeResultsConstant xxx links to Constant
-- TelescopeResultsDiffAdd xxx links to DiffAdd
-- TelescopeResultsDiffChange xxx links to DiffChange
-- TelescopeResultsDiffDelete xxx links to DiffDelete
-- TelescopeResultsDiffUntracked xxx links to NonText
-- TelescopeResultsField xxx links to Function
-- TelescopeResultsFunction xxx links to Function
-- TelescopeResultsIdentifier xxx links to Identifier
-- TelescopeResultsLineNr xxx links to LineNr
-- TelescopeResultsMethod xxx links to Method
-- TelescopeResultsNormal xxx links to TelescopeNormal
-- TelescopeResultsNumber xxx links to Number
-- TelescopeResultsOperator xxx links to Operator
-- TelescopeResultsSpecialComment xxx links to SpecialComment
-- TelescopeResultsStruct xxx links to Struct
-- TelescopeResultsTitle xxx links to TelescopeTitle
-- TelescopeResultsVariable xxx links to SpecialChar
-- TelescopeSelection xxx links to Visual
-- TelescopeSelectionCaret xxx links to TelescopeSelection
-- TelescopeTitle xxx links to TelescopeBorder
