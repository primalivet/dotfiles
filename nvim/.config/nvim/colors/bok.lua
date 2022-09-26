-- " Nano
-- " ----------------------------------------------------------------------------
-- Open color

local colors = {
  black = "#000000",
  blue0 = "#e7f5ff",
  blue1 = "#d0ebff",
  blue2 = "#a5d8ff",
  blue3 = "#74c0fc",
  blue4 = "#4dabf7",
  blue5 = "#339af0",
  blue6 = "#228be6",
  blue7 = "#1c7ed6",
  blue8 = "#1971c2",
  blue9 = "#1864ab",
  cyan0 = "#e3fafc",
  cyan1 = "#c5f6fa",
  cyan2 = "#99e9f2",
  cyan3 = "#66d9e8",
  cyan4 = "#3bc9db",
  cyan5 = "#22b8cf",
  cyan6 = "#15aabf",
  cyan7 = "#1098ad",
  cyan8 = "#0c8599",
  cyan9 = "#0b7285",
  grape0 = "#f8f0fc",
  grape1 = "#f3d9fa",
  grape2 = "#eebefa",
  grape3 = "#e599f7",
  grape4 = "#da77f2",
  grape5 = "#cc5de8",
  grape6 = "#be4bdb",
  grape7 = "#ae3ec9",
  grape8 = "#9c36b5",
  grape9 = "#862e9c",
  gray0 = "#f8f9fa",
  gray1 = "#f1f3f5",
  gray2 = "#e9ecef",
  gray3 = "#dee2e6",
  gray4 = "#ced4da",
  gray5 = "#adb5bd",
  gray6 = "#868e96",
  gray7 = "#495057",
  gray8 = "#343a40",
  gray9 = "#212529",
  green0 = "#ebfbee",
  green1 = "#d3f9d8",
  green2 = "#b2f2bb",
  green3 = "#8ce99a",
  green4 = "#69db7c",
  green5 = "#51cf66",
  green6 = "#40c057",
  green7 = "#37b24d",
  green8 = "#2f9e44",
  green9 = "#2b8a3e",
  indigo0 = "#edf2ff",
  indigo1 = "#dbe4ff",
  indigo2 = "#bac8ff",
  indigo3 = "#91a7ff",
  indigo4 = "#748ffc",
  indigo5 = "#5c7cfa",
  indigo6 = "#4c6ef5",
  indigo7 = "#4263eb",
  indigo8 = "#3b5bdb",
  indigo9 = "#364fc7",
  lime0 = "#f4fce3",
  lime1 = "#e9fac8",
  lime2 = "#d8f5a2",
  lime3 = "#c0eb75",
  lime4 = "#a9e34b",
  lime5 = "#94d82d",
  lime6 = "#82c91e",
  lime7 = "#74b816",
  lime8 = "#66a80f",
  lime9 = "#5c940d",
  orange0 = "#fff4e6",
  orange1 = "#ffe8cc",
  orange2 = "#ffd8a8",
  orange3 = "#ffc078",
  orange4 = "#ffa94d",
  orange5 = "#ff922b",
  orange6 = "#fd7e14",
  orange7 = "#f76707",
  orange8 = "#e8590c",
  orange9 = "#d9480f",
  pink0 = "#fff0f6",
  pink1 = "#ffdeeb",
  pink2 = "#fcc2d7",
  pink3 = "#faa2c1",
  pink4 = "#f783ac",
  pink5 = "#f06595",
  pink6 = "#e64980",
  pink7 = "#d6336c",
  pink8 = "#c2255c",
  pink9 = "#a61e4d",
  red0 = "#fff5f5",
  red1 = "#ffe3e3",
  red2 = "#ffc9c9",
  red3 = "#ffa8a8",
  red4 = "#ff8787",
  red5 = "#ff6b6b",
  red6 = "#fa5252",
  red7 = "#f03e3e",
  red8 = "#e03131",
  red9 = "#c92a2a",
  teal0 = "#e6fcf5",
  teal1 = "#c3fae8",
  teal2 = "#96f2d7",
  teal3 = "#63e6be",
  teal4 = "#38d9a9",
  teal5 = "#20c997",
  teal6 = "#12b886",
  teal7 = "#0ca678",
  teal8 = "#099268",
  teal9 = "#087f5b",
  violet0 = "#f3f0ff",
  violet1 = "#e5dbff",
  violet2 = "#d0bfff",
  violet3 = "#b197fc",
  violet4 = "#9775fa",
  violet5 = "#845ef7",
  violet6 = "#7950f2",
  violet7 = "#7048e8",
  violet8 = "#6741d9",
  violet9 = "#5f3dc4",
  white = "#ffffff",
  yellow0 = "#fff9db",
  yellow1 = "#fff3bf",
  yellow2 = "#ffec99",
  yellow3 = "#ffe066",
  yellow4 = "#ffd43b",
  yellow5 = "#fcc419",
  yellow6 = "#fab005",
  yellow7 = "#f59f00",
  yellow8 = "#f08c00",
  yellow9 = "#e67700",
}

local palette = {
  bg = colors.gray0,
  body = colors.gray8,
  subtle = colors.gray2,
  popout = colors.orange8,
  selection = colors.yellow0,
  salient = colors.violet8,
  faded = colors.gray5,
  critical = colors.red8,
}

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "bok"

local hl = function(hldef)
  return function(group)
    vim.api.nvim_set_hl(0, group, hldef)
  end
end

local merge = function(fst, snd)
  return vim.tbl_deep_extend("force", fst, snd)
end

local body = function(hldef)
  return merge(hldef or {}, { fg = palette.body })
end

local hide = function(hldef)
  return merge(hldef or {}, { fg = palette.bg })
end

-- information that needs attention
local popout = function(hldef)
  return merge(hldef or {}, { fg = palette.popout })
end

-- information that is currently selected
local selection = function(hldef)
  return merge(hldef or {}, { bg = palette.selection })
end

-- information that are important
local salient = function(hldef)
  return merge(hldef or {}, { fg = palette.salient })
end

-- information that is secondary and less important
local faded = function(hldef)
  return merge(hldef or {}, { fg = palette.faded })
end

-- inforamtion that require immediate action
local critical = function(hldef)
  return merge(hldef or {}, { fg = palette.body, bg = palette.red8 })
end

-- information that has structural meaning
local strong = function(hldef)
  return merge(hldef or {}, { bold = 1 })
end

-- physical area on the screen
local subtle = function(hldef)
  return merge(hldef or {}, { fg = palette.body, bg = palette.subtle })
end

-- physical area on the screen, background only
local subtle_bg = function(hldef)
  return merge(hldef or {}, { bg = palette.subtle })
end

local italic = function(hldef)
  return merge(hldef or {}, { italic = 1 })
end

local underline = function(hldef)
  return merge(hldef or {}, { underline = 1 })
end

local hl_body = function(group)
  hl(body())(group)
end

local hl_faded = function(group)
  hl(faded())(group)
end

local hl_hide = function(group)
  hl(hide())(group)
end

local hl_subtle = function(group)
  hl(subtle())(group)
end

local hl_selection = function(group)
  hl(selection())(group)
end

hl_body("ColorColumn")
hl_body("Conceal")
hl_body("Cursor")
hl_body("CursorColumn")
hl_body("CursorIM")
hl_body("CursorLine")
hl_body("CursorLineFold")
hl_body("CursorLineNr")
hl_body("CursorLineSign")
hl_body("DiffAdd")
hl_body("DiffChange")
hl_body("DiffDelete")
hl_body("DiffText")
hl_body("Directory")
hl_hide("EndOfBuffer")
hl_body("ErrorMsg")
hl_body("FoldColumn")
hl_body("Folded")
hl_faded("LineNr")
hl_faded("LineNrAbove")
hl_faded("LineNrBelow")
hl_selection("MatchParen")
hl_body("ModeMsg")
hl_body("MoreMsg")
hl_body("MsgSeparator")
hl_body("NonText")
hl_body("Normal")
hl_body("NormalNC")
hl_body("Question")
hl_faded("SignColumn")
hl_body("SpecialKey")
hl_body("SpellBad")
hl_body("SpellCap")
hl_body("SpellLocal")
hl_body("SpellRare")
hl_body("Substitute")
hl_body("TabLine")
hl_body("TabLineFill")
hl_body("TabLineSel")
hl_body("TermCursor")
hl_body("TermCursorNC")
hl_body("Title")
hl_body("VisualNOS")
hl_body("WarningMsg")
hl_body("Whitespace")
hl_body("WildMenu")
hl_body("lCursor")

hl_subtle("Pmenu")
hl_subtle("PmenuSbar")
hl_selection("PmenuSel")
hl(faded({ reverse = 1 }))("PmenuThumb")

hl(subtle())("Search")
hl(subtle())("IncSearch")
hl(subtle_bg())("Visual")
hl(subtle())("MsgArea")
hl(subtle(underline(strong())))("StatusLine")
hl(subtle(underline()))("StatusLineNC")
hl_selection("QuickFixLine")
hl_subtle("NormalFloat")
hl(faded())("VertSplit")
hl(faded())("WinSeparator")

-- Suggested Group names (by Vim, see :h group-name)
-- TODO: Switch for Treesitter groups
hl_faded("Comment")
hl(popout())("Constant")
hl_body("Identifier")
hl(salient())("Statement")
hl_body("PreProc")
hl(strong(italic()))("Type")
hl_body("Special")
hl_body("Ignore")
hl_body("Underlined")
hl_body("Error")
hl_selection("Todo")

-- GitSigns (plugin)
hl_faded("GitSignsAdd")
hl_faded("GitSignsChange")
hl_faded("GitSignsDelete")
