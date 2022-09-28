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

local palette = vim.opt.background:get() == "light"
    and {
      bg = colors.gray1,
      body = colors.gray8,
      faded = colors.gray6,
      subtle = colors.gray3,
      popout = colors.orange9,
      salient = colors.violet9,
      selection = colors.yellow0,
      critical = colors.red9,
      critical_bg = colors.yellow0,
      success = colors.green9,
      success_bg = colors.green0,
      warning = colors.yellow9,
      warning_bg = colors.yellow0,
    }
  or {
    bg = colors.gray9,
    body = colors.gray2,
    faded = colors.gray5,
    subtle = colors.gray7,
    popout = colors.orange4,
    salient = colors.violet4,
    selection = colors.yellow9,
    critical = colors.red4, -- TODO
    critical_bg = colors.red9, -- TODO
    success = colors.green4, -- TODO
    success_bg = colors.green9, -- TODO
    warning = colors.yellow4, -- TODO
    warning_bg = colors.yellow9, -- TODO
  }

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "bok"

local hi = function(group)
  return function(hldefs)
    local hldef = {}
    for _, f in pairs(hldefs) do
      hldef = f(hldef)
    end
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

-- information that has structural meaning
local strong = function(hldef)
  return merge(hldef or {}, { bold = 1 })
end

-- information that can indicate a link or similar
local underline = function(hldef)
  return merge(hldef or {}, { underline = 1 })
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

local reverse = function(hldef)
  return merge(hldef or {}, { reverse = 1 })
end

local diff_add = function(hldef)
  return merge(hldef or {}, { fg = palette.success, bg = palette.success_bg })
end
local diff_change = function(hldef)
  return merge(hldef or {}, { fg = palette.warning, bg = palette.warning_bg })
end
local diff_remove = function(hldef)
  return merge(hldef or {}, { fg = palette.critical, bg = palette.critical_bg })
end

hi("ColorColumn")({ body })
hi("Conceal")({ body })
hi("Cursor")({ body })
hi("CursorColumn")({ body })
hi("CursorIM")({ body })
hi("CursorLine")({ body })
hi("CursorLineFold")({ body })
hi("CursorLineNr")({ body })
hi("CursorLineSign")({ body })
hi("Directory")({ body })
hi("ErrorMsg")({ body }) -- TODO
hi("FoldColumn")({ body })
hi("Folded")({ body })
hi("ModeMsg")({ faded })
hi("MoreMsg")({ body })
hi("MsgSeparator")({ body })
hi("NonText")({ body })
hi("Normal")({ body })
hi("NormalNC")({ body })
hi("Question")({ body })
hi("SpecialKey")({ body })
hi("SpellBad")({ body })
hi("SpellCap")({ body })
hi("SpellLocal")({ body })
hi("SpellRare")({ body })
hi("Substitute")({ body })
hi("TabLine")({ body })
hi("TabLineFill")({ body })
hi("TabLineSel")({ body })
hi("TermCursor")({ body })
hi("TermCursorNC")({ body })
hi("Title")({ body })
hi("VisualNOS")({ body })
hi("WarningMsg")({ body })
hi("Whitespace")({ body })
hi("WildMenu")({ body })
hi("lCursor")({ body })

hi("LineNr")({ faded })
hi("LineNrAbove")({ faded })
hi("LineNrBelow")({ faded })
hi("SignColumn")({ faded })
hi("EndOfBuffer")({ hide })
hi("MatchParen")({ selection })

hi("DiffAdd")({ diff_add })
hi("DiffChange")({ diff_change })
hi("DiffDelete")({ diff_remove })
hi("DiffText")({ diff_change, italic })

hi("Pmenu")({ subtle })
hi("PmenuSbar")({ subtle })
hi("PmenuSel")({ strong, popout })
hi("PmenuThumb")({ faded, reverse })

hi("Search")({ subtle })
hi("IncSearch")({ subtle })
hi("Visual")({ subtle_bg })
hi("MsgArea")({ faded })
hi("StatusLine")({ subtle, strong })
hi("StatusLineNC")({ subtle })
hi("QuickFixLine")({ selection })
hi("NormalFloat")({ subtle })
hi("VertSplit")({ faded })
hi("WinSeparator")({ faded })

-- Suggested Group names (by Vim, see :h group-name)
hi("Comment")({ faded, italic })
hi("Constant")({ popout })
hi("Identifier")({ body })
hi("Statement")({ salient })
hi("PreProc")({ body })
hi("Type")({ strong, italic })
hi("Special")({ body })
hi("Ignore")({ body })
hi("Underlined")({ underline })
hi("Error")({ body }) -- TODO
hi("Todo")({ selection })

-- GitSigns (plugin)
hi("GitSignsAdd")({ faded })
hi("GitSignsChange")({ faded })
hi("GitSignsDelete")({ faded })
