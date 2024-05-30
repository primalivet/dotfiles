vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

if not vim.opt.termguicolors:get() then
  print("Colorscheme \"Sixteen\" should be used with option 'termguicolors', \nATTN: enabling termguicolors")
end

vim.opt.termguicolors = true
vim.g.colors_name = "sixteen-tc"

local is_dark = vim.opt.background:get() == "dark"

local black = "#111111"
local red = "#fd5e00"
local green = "#066D4D"
local yellow = "#ffd800"
local blue = "#00508F"
local magenta = "#870087"
local cyan = "#00605f"
local white = "#9e9e9e"
local bright_black = "#3a3a3a"
local bright_red = "#ff875f"
local bright_green = "#01af87"
local bright_yellow = "#ffff5f"
local bright_blue = "#01afff"
local bright_magenta = "#875faf"
local bright_cyan = "#008787"
local bright_white = "#dadada"

-- extra colors (Cheating)
local diff_add = is_dark and "#006C00" or "#C4DFCD"
local diff_change = diff_add
local diff_delete = is_dark and "#760000" or "#E3CBC9"
local diff_text = is_dark and "#009500" or "#D5F4E1"

local foreground = is_dark and bright_white or black
local background = is_dark and black or bright_white
local elevation = is_dark and bright_black or white
local keyword = is_dark and bright_yellow or blue
local string = is_dark and bright_green or green
local comment = is_dark and bright_cyan or cyan
local type = foreground
local error = is_dark and bright_red or red
local info = comment
local warn = is_dark and bright_yellow or bright_red

local set_hl = vim.api.nvim_set_hl

local reset = function(group)
  vim.api.nvim_set_hl(0, group, { fg = foreground })
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

set_hl(0, "TabLine", { fg = foreground, bg = elevation })
set_hl(0, "TabLineFill", { bg = elevation })
reset("TabLineSel")

set_hl(0, "CursorLine", { underline = true })

set_hl(0, "WildMenu", { fg = keyword, bg = elevation, bold = true })

set_hl(0, "DiffAdd", { bg = diff_add })
set_hl(0, "DiffChange", { bg = diff_change })
set_hl(0, "DiffDelete", { bg = diff_delete })
set_hl(0, "DiffText", { bg = diff_text })

set_hl(0, "DiagnosticError", { fg = error })
set_hl(0, "DiagnosticHint", { fg = info })
set_hl(0, "DiagnosticInfo", { fg = info })
set_hl(0, "DiagnosticWarn", { fg = warn })

set_hl(0, "MatchParen", { reverse = true })

set_hl(0, "Visual", { bg = elevation })

set_hl(0, "QuickFixLine", { fg = keyword, bg = elevation })

set_hl(0, "Normal", { fg = foreground, bg = background })
link("NormalNC", "Normal")

set_hl(0, "NormalFloat", { bg = elevation })

set_hl(0, "Pmenu", { bg = elevation })
link("PmenuSbar", "Pmenu")
link("PmenuSel", "WildMenu")
link("PmenuThumb", "PmenuSbar")

set_hl(0, "Search", { fg = keyword, reverse = true })
link("IncSearch", "Search")
link("Substitute", "Search")

set_hl(0, "Whitespace", { fg = elevation })
link("NonText", "Whitespace")
link("EndOfBuffer", "Whitespace")
link("SpecialKey", "Whitespace")

set_hl(0, "Folded", { bg = elevation })

set_hl(0, "StatusLine", { reverse = true })
set_hl(0, "StatusLineNC", { bg = elevation })

set_hl(0, "WinSeparator", { fg = elevation })
link("VertSplit", "WinSeparator")

set_hl(0, "LineNr", { fg = elevation })
set_hl(0, "CursorLineNr", { fg = keyword })
set_hl(0, "LineNrAbove", { fg = elevation })
set_hl(0, "LineNrBelow", { fg = elevation })

-- Syntax

set_hl(0, "Comment", { fg = comment, italic = true })

link("Constant", "Normal")
set_hl(0, "String", { fg = string })
link("Character", "String")
link("Number", "Constant")
set_hl(0, "Boolean", { fg = keyword, bold = true })
link("Float", "Constant")

reset("Identifier")
link("Function", "Identifier")

set_hl(0, "Statement", { fg = keyword, bold = true })
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

set_hl(0, "Type", { fg = type, italic = true })
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

link("MiniPickNormal", "Normal") -- basic foreground/background highlighting.
reset("MiniPickBorder") -- window border.
link("MiniPickBorderBusy", "DiagnosticWarn") -- window border while picker is busy processing.
reset("MiniPickBorderText") -- non-prompt on border.
set_hl(0, "MiniPickIconDirectory", { fg = background, bg = background }) -- default icon for directory.
set_hl(0, "MiniPickIconFile", { fg = background, bg = background }) -- default icon for file.
reset("MiniPickHeader") -- headers in info buffer and previews.
link("MiniPickMatchCurrent", "PmenuSel") -- current matched item.
reset("MiniPickMatchMarked") -- marked matched items.
link("MiniPickMatchRanges", "QuickFixLine") -- ranges matching query elements.
reset("MiniPickPreviewLine") -- target line in preview.
reset("MiniPickPreviewRegion") -- target region in preview.
reset("MiniPickPrompt") -- prompt.
