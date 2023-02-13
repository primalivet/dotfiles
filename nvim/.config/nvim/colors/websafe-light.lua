-- " Websafe

vim.g.background = "light"
vim.g.colors_name = "websafe-light"

local black = "#000000"
local white = "#ffffff"

local grey = {
  "#f1f1f1",
  "#e1e1e1",
  "#d1d1d1",
  "#c1c1c1",
  "#cccccc",
  "#999999",
  "#444444",
}

local red = "#660000"
local green = "#006600"
local yellow = "#666600"
local blue = "#000066"
local magenta = "#660066"
local cyan = "#006666"

local bright_red = "#ff0000"
local bright_green = "#00ff00"
local bright_yellow = "#ffff00"
local bright_blue = "#0000ff"
local bright_magenta = "#ff00ff"
local bright_cyan = "#00ffff"

local bg_red = "#ffcccc"
local bg_green = "#ccffcc"
local bg_yellow = "#ffffcc"
local bg_blue = "#cce1ff"
local bg_magenta = "#ffccff"
local bg_cyan = "#ccffff"

local background = grey[1]
local highlight = yellow

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

local highlights = {
  Disable = {},

  -- Editor groups
  ColorColumn = { link = "Disable" },
  Conceal = { link = "Disable" },
  Cursor = { link = "Disable" },
  CursorColumn = { link = "Disable" },
  CursorIM = { link = "Disable" },
  CursorLine = { link = "Disable" },
  CursorLineFold = { link = "Disable" },
  CursorLineNr = { link = "Disable" },
  CursorLineSign = { link = "Disable" },
  DiffAdd = { bg = bg_green },
  DiffChange = { bg = bg_yellow },
  DiffDelete = { bg = bg_red },
  DiffText = { bold = 1 },
  Directory = { link = "Disable" },
  EndOfBuffer = { link = "Disable" },
  ErrorMsg = { fg = black, bg = bg_red },
  FoldColumn = { link = "Disable" },
  Folded = { link = "Disable" },
  IncSearch = { link = "Disable" },
  LineNr = { link = "Disable" },
  LineNrAbove = { link = "Disable" },
  LineNrBelow = { link = "Disable" },
  MatchParen = { link = "Disable" },
  ModeMsg = { link = "Disable" },
  MoreMsg = { link = "Disable" },
  MsgArea = { link = "Disable" },
  MsgSeparator = { link = "Disable" },
  NonText = { link = "Disable" },
  Normal = { fg = black, bg = background },
  NormalFloat = { bg = grey[2] },
  NormalNC = { link = "Disable" },
  Pmenu = { bg = grey[2] },
  PmenuSbar = { bg = grey[3] },
  PmenuSel = { bg = bg_yellow },
  PmenuThumb = { bg = grey[4] },
  Question = { link = "Disable" },
  QuickFixLine = { bg = bg_yellow },
  Search = { link = "Disable" },
  SignColumn = { link = "Disable" },
  SpecialKey = { link = "Disable" },
  SpellBad = { link = "Disable" },
  SpellCap = { link = "Disable" },
  SpellLocal = { link = "Disable" },
  SpellRare = { link = "Disable" },
  StatusLine = { fg = white, bg = black },
  StatusLineNC = { fg = black, bg = grey[4] },
  Substitute = { link = "Disable" },
  TabLine = { link = "Disable" },
  TabLineFill = { link = "Disable" },
  TabLineSel = { link = "Disable" },
  TermCursor = { link = "Disable" },
  TermCursorNC = { link = "Disable" },
  Title = { link = "Disable" },
  VertSplit = { link = "Disable" },
  Visual = { bg = bg_blue },
  VisualNOS = { link = "Disable" },
  WarningMsg = { fg = black, bg = bg_yellow },
  Whitespace = { link = "Disable" },
  WildMenu = { fg = black, bg = bg_yellow },
  WinSeparator = { link = "Disable" },
  lCursor = { link = "Disable" },

  -- Syntax groups
  Comment = { fg = cyan, italic = true },
  Constant = { link = "Normal" },
  String = { fg = red },
  Identifier = { link = "Normal" },
  Statement = { fg = green, bold = true },
  PreProc = { fg = magenta },
  Type = { fg = bright_blue },
  Special = { link = "Normal" },
  Underline = { link = "Normal" },
  Ignore = { link = "Normal" },
  Error = { link = "Normal" },
  Todo = { link = "Normal" },

  -- Diagnostics

  DiagnosticHint = { link = "Disable" },
  DiagnosticInfo = { link = "Disable" },
  DiagnosticWarn = { fg = yellow, bg = bg_yellow },
  DiagnosticError = { fg = red, bg = bg_red },
  -- TODO:
  -- DiagnosticSignHint = { fg = black, bg = "none" },
  -- DiagnosticSignInfo = { fg = black, bg = "none" },
  -- DiagnosticSignWarn = { fg = yellow, bg = "none" },
  -- DiagnosticSignError = { fg = red, bg = "none" },
  -- TODO:
  -- DiagnosticFloatingHint = { link = "Disable" },
  -- DiagnosticFloatingInfo = { link = "Disable" },
  -- DiagnosticFloatingWarn = { link = "Disable" },
  -- DiagnosticFloatingError = { link = "Disable" },

  -- GitSigns
  GitSignsAdd = { fg = green, bg = bg_green },
  GitSignsChange = { fg = yellow, bg = bg_yellow },
  GitSignsDelete = { fg = red, bg = bg_red },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

-- -- Treesitter

-- reset("TSCharacter") -- Character literals: `'a'` in C.
-- reset("TSCharacterSpecial") -- Special characters.
-- reset("TSConstBuiltin") -- Built-in constant values: `nil` in Lua.
-- reset("TSConstMacro") -- Constants defined by macros: `NULL` in C.
-- reset("TSConstant") -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
-- reset("TSDanger") -- Text representation of a danger note.
-- reset("TSDefine") -- Preprocessor #define statements.
-- reset("TSEmphasis") -- Text to be represented with emphasis.
-- reset("TSEnvironment") -- Text environments of markup languages.
-- reset("TSEnvironmentName") -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
-- reset("TSError") -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
-- reset("TSField") -- Object and struct fields.
-- reset("TSFloat") -- Floating-point number literals.
-- reset("TSFuncBuiltin") -- Built-in functions: `print` in Lua.
-- reset("TSFuncMacro") -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
-- reset("TSFunction") -- Function definitions.
-- reset("TSFunctionCall") -- Function calls.
-- reset("TSLabel") -- GOTO labels: `label:` in C, and `::label::` in Lua.
-- reset("TSLiteral") -- Literal or verbatim text.
-- reset("TSMath") -- Math environments like LaTeX's `$ ... $`.
-- reset("TSMethod") -- Method definitions.
-- reset("TSMethodCall") -- Method calls.
-- reset("TSNamespace") -- Identifiers referring to modules and namespaces.
-- reset("TSNone") -- No highlighting (sets all highlight arguments to `NONE`). This group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
-- reset("TSNote") -- Text representation of an informational note.
-- reset("TSNumber") -- Numeric literals that don't fit into other categories.
-- reset("TSParameter") -- Parameters of a function.
-- reset("TSParameterReference") -- References to parameters of a function.
-- reset("TSPreProc") -- Preprocessor #if, #else, #endif, etc.
-- -- reset("TSProperty") -- Same as `TSField`.
-- reset("TSStrike") -- Strikethrough text.
-- reset("TSStringEscape") -- Escape characters within a string: `\n`, `\t`, etc.
-- reset("TSStringRegex") -- Regular expression literals.
-- reset("TSStringSpecial") -- Strings with special meaning that don't fit into the previous categories.
-- reset("TSStrong") -- Text to be represented in bold.
-- reset("TSSymbol") -- Identifiers referring to symbols or atoms.
-- reset("TSTag") -- Tags like HTML tag names.
-- reset("TSTagAttribute") -- HTML tag attributes.
-- reset("TSText") -- Non-structured text. Like text in a markup language.
-- reset("TSTextReference") -- Footnotes, text references, citations, etc.
-- reset("TSTitle") -- Text that is part of a title.
-- reset("TSURI") -- URIs like hyperlinks or email addresses.
-- reset("TSUnderline") -- Text to be represented with an underline.
-- reset("TSVariableBuiltin") -- Variable names defined by the language: `this` or `self` in Javascript.
-- reset("TSWarning") -- Text representation of a warning note.
-- reset("TSAttribute") -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.

-- set_hl(0, "TSConditional", { ctermfg = green, bold = 1 }) -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
-- set_hl(0, "TSDebug", { ctermfg = green, bold = 1 }) -- Debugging statements.
-- set_hl(0, "TSKeyword", { ctermfg = green, bold = 1 }) -- Keywords that don't fit into other categories.
-- set_hl(0, "TSKeywordFunction", { ctermfg = green, bold = 1 }) -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
-- set_hl(0, "TSKeywordOperator", { ctermfg = green, bold = 1 }) -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
-- set_hl(0, "TSKeywordReturn", { ctermfg = green, bold = 1 }) -- Keywords like `return` and `yield`.
-- set_hl(0, "TSException", { ctermfg = green, bold = 1 }) --  Exception related keywords: `try`, `except`, `finally` in Python.
-- set_hl(0, "TSRepeat", { ctermfg = green, bold = 1 }) -- Keywords related to loops: `for`, `while`, etc.
-- set_hl(0, "TSBoolean", { ctermfg = green, bold = 1 }) -- Boolean literals: `True` and `False` in Python.
-- set_hl(0, "TSStorageClass", { ctermfg = green, bold = 1 }) -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
-- set_hl(0, "TSInclude", { ctermfg = green, bold = 1 }) -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
-- set_hl(0, "TSTypeDefinition", { ctermfg = green, bold = 1 }) -- Type definitions, e.g. `typedef` in C.
-- set_hl(0, "TSTypeQualifier", { ctermfg = green, bold = 1 }) -- Qualifiers on types, e.g. `const` or `volatile` in C or `mut` in Rust.

-- set_hl(0, "TSComment", { ctermfg = bright_cyan, italic = 1 }) -- Line comments and block comments.

-- set_hl(0, "TSString", { ctermfg = red }) -- String literals.

-- set_hl(0, "TSType", { ctermfg = bright_blue, bold = 1 }) -- Type (and class) definitions and annotations.
-- set_hl(0, "TSTypeBuiltin", { ctermfg = bright_blue, bold = 1 }) -- Built-in types: `i32` in Rust.
-- set_hl(0, "TSConstructor", { ctermfg = bright_blue, bold = 1 }) -- Constructor calls and definitions: `{}` in Lua, and Java constructors.

-- set_hl(0, "TSVariable", { ctermfg = blue }) -- Variable names that don't fit into other categories.

-- set_hl(0, "TSOperator", { bold = 1 }) -- Binary or unary operators: `+`, and also `->` and `*` in C.
-- set_hl(0, "TSPunctBracket", { bold = 1 }) -- Brackets, braces, parentheses, etc.
-- set_hl(0, "TSPunctDelimiter", { bold = 1 }) -- Punctuation delimiters: Periods, commas, semicolons, etc.
-- set_hl(0, "TSPunctSpecial", { bold = 1 }) -- Special punctuation that doesn't fit into the previous categories.
-- set_hl(0, "TSTagDelimiter", { bold = 1 }) -- Tag delimiters like `<` `>` `/`.

-- set_hl(0, "TSTodo", { ctermfg = black, ctermbg = yellow }) -- Anything that needs extra attention, such as keywords like TODO or FIXME.
