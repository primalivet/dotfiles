vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

if vim.opt.termguicolors:get() then
  print("Colorscheme \"Sixteen\" should be used without option 'termguicolors', \nATTN: disabling termguicolors")
end

vim.opt.termguicolors = false
vim.g.colors_name = "sixteen"

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

-- extra colors (Cheating)
local diff_add = 22
local diff_change = 22
local diff_delete = 52
local diff_text = 28
local almost_black = 235
local almost_blacker = 234

local added = green
local changed = yellow
local removed = red
local foreground = bright_white
local foreground_dim_1 = white
local background = black
local background_elevation_1 = almost_blacker
local background_elevation_2 = almost_black
local keyword = yellow
local string = bright_green
local comment = bright_cyan
local type = white
local error = red
local info = comment
local warn = yellow

local set_hl = vim.api.nvim_set_hl

local reset = function(group)
  vim.api.nvim_set_hl(0, group, { ctermfg = "NONE", ctermbg = "NONE" })
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
reset("Normal")
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

set_hl(0, "TabLine", { ctermfg = foreground, ctermbg = background_elevation_1 })
set_hl(0, "TabLineFill", { ctermbg = background_elevation_1 })
reset("TabLineSel")

set_hl(0, "WildMenu", { ctermfg = keyword, ctermbg = background_elevation_1, bold = true })

set_hl(0, "DiffAdd", { ctermbg = diff_add })
set_hl(0, "DiffChange", { ctermbg = diff_change })
set_hl(0, "DiffDelete", { ctermbg = diff_delete })
set_hl(0, "DiffText", { ctermbg = diff_text })

set_hl(0, "DiagnosticError", { ctermfg = error })
set_hl(0, "DiagnosticHint", { ctermfg = info })
set_hl(0, "DiagnosticInfo", { ctermfg = info })
set_hl(0, "DiagnosticWarn", { ctermfg = warn })

set_hl(0, "MatchParen", { reverse = true })

set_hl(0, "Visual", { ctermbg = background_elevation_1 })

set_hl(0, "QuickFixLine", { ctermfg = keyword, ctermbg = background_elevation_1 })

link("NormalNC", "Normal")

set_hl(0, "NormalFloat", { ctermbg = background_elevation_1 })

set_hl(0, "Pmenu", { ctermbg = background_elevation_1 })
link("PmenuSbar", "Pmenu")
link("PmenuSel", "WildMenu")
link("PmenuThumb", "PmenuSbar")

set_hl(0, "Search", { ctermfg = keyword, reverse = true })
link("IncSearch", "Search")
link("Substitute", "Search")

set_hl(0, "Whitespace", { ctermfg = background_elevation_2 })
link("NonText", "Whitespace")
link("EndOfBuffer", "Whitespace")
link("SpecialKey", "Whitespace")

set_hl(0, "Folded", { ctermbg = background_elevation_1 })

set_hl(0, "StatusLine", { ctermbg = background_elevation_2 })
set_hl(0, "StatusLineNC", { ctermfg = foreground_dim_1, ctermbg = background_elevation_1 })

set_hl(0, "WinSeparator", { ctermfg = background_elevation_1 })
link("VertSplit", "WinSeparator")

set_hl(0, "LineNr", { ctermfg = foreground_dim_1 })
set_hl(0, "CursorLineNr", { ctermfg = foreground })
set_hl(0, "LineNrAbove", { ctermfg = foreground_dim_1 })
set_hl(0, "LineNrBelow", { ctermfg = foreground_dim_1 })

-- Syntax

set_hl(0, "Comment", { ctermfg = comment })

link("Constant", "Normal")
set_hl(0, "String", { ctermfg = string })
link("Character", "String")
link("Number", "Constant")
link("Boolean", "Constant")
link("Float", "Constant")

reset("Identifier")
link("Function", "Identifier")

set_hl(0, "Statement", { ctermfg = keyword })
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

set_hl(0, "Type", { ctermfg = type })
link("StorageClass", "Normal")
link("Structure", "Type")
link("Typedef", "Type")

link("Special")
link("Tag", "Special")
link("Delimiter", "Special")
link("SpecialComment", "Special")
link("Debug", "Special")

set_hl(0, "Added", { ctermfg = added })
set_hl(0, "Changed", { ctermfg = changed })
set_hl(0, "Removed", { ctermfg = removed })


reset("DiagnosticSignError")
reset("DiagnosticSignWarn")
reset("DiagnosticSignInfo")
reset("DiagnosticSignHint")
reset("DiagnosticSignOk")

-- Treesitter
-- see :h treesitter-highlight

set_hl(0, "@tag", { ctermfg = keyword })           -- XML-style tag names (e.g. in XML, HTML, etc.)
set_hl(0, "@tag.builtin", { ctermfg = keyword })   -- XML-style tag names (e.g. HTML5 tags)
reset("@tag.attribute")                            -- XML-style tag attributes
set_hl(0, "@tag.delimiter", { ctermfg = keyword }) -- XML-style tag delimiters

link( "@type.builtin", "Type")
-- set_hl(0, "@type.builtin.c", { ctermfg = type })

-- Plugins
link("MiniDiffSignAdd", "Normal")
link("MiniDiffSignChange", "Normal")
link("MiniDiffSignDelete", "Normal")
