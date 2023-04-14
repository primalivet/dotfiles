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
local bright_white = "#ffffff"

local extra_bright_red = "#ffdddd"
local extra_bright_green = "#ddffdd"
local extra_bright_yellow = "#ffffdd"
local extra_bright_blue = "#ddddff"
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

set_hl(0, "SignColumn", { bg = white })
set_hl(0, "NormalFloat", { fg = "NONE", bg = white })

set_hl(0, "Pmenu", { link = "NormalFloat" })
set_hl(0, "PmenuSbar", {})
set_hl(0, "PmenuSel", { link = "WildMenu" })
set_hl(0, "PmenuThumb", { bg = black })

set_hl(0, "WildMenu", { fg = bright_white, bg = blue })

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

set_hl(0, "LineNr", { fg = blue })
set_hl(0, "LineNrAbove", { link = "LineNr" })
set_hl(0, "LineNrBelow", { link = "LineNr" })

-- Suggested Group names (by Vim, see :h group-name)
set_hl(0, "Comment", { fg = green, italic = 1 })
set_hl(0, "Constant", { fg = red })
set_hl(0, "Identifier", { bold = 1 })
set_hl(0, "Statement", { fg = blue, bold = 1 })
set_hl(0, "PreProc", { bold = 1 })
set_hl(0, "Type", { fg = bright_blue })
reset("Special")
reset("Ignore")
set_hl(0, "Underlined", { underline = 1 })
set_hl(0, "Error", { fg = red })
set_hl(0, "Todo", { fg = black, bg = bright_yellow })

-- Diagnostics
set_hl(0, "DiagnosticError", { fg = bright_red })
set_hl(0, "DiagnosticWarn", { fg = bright_yellow })
set_hl(0, "DiagnosticInfo", { fg = bright_blue })
set_hl(0, "DiagnosticHint", { fg = bright_blue })
set_hl(0, "DiagnosticVirtualTextError", { fg = bright_red, italic = 1 })
set_hl(0, "DiagnosticVirtualTextWarn", { fg = bright_yellow, italic = 1 })
set_hl(0, "DiagnosticVirtualTextInfo", { fg = bright_blue, italic = 1 })
set_hl(0, "DiagnosticVirtualTextHint", { fg = bright_blue, italic = 1 })

-- GitSigns (plugin)
set_hl(0, "GitSignsAdd", { fg = green })
set_hl(0, "GitSignsChange", { fg = blue })
set_hl(0, "GitSignsDelete", { fg = red })

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
