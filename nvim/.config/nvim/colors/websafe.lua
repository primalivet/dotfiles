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

set_hl(0, "NormalFloat", { ctermfg = "NONE", ctermbg = white })
set_hl(0, "Pmenu", { ctermfg = "NONE", ctermbg = white })
set_hl(0, "PmenuSbar", { reverse = white })
set_hl(0, "PmenuSel", { reverse = 1 })
set_hl(0, "PmenuThumb", { ctermbg = black })

set_hl(0, "StatusLine", { reverse = 1, bold = 1 })
set_hl(0, "StatusLineNC", { reverse = 1 })
set_hl(0, "QuickFixLine", { ctermfg = white, ctermbg = green })
set_hl(0, "VertSplit", { reverse = 1 })
set_hl(0, "WinSeparator", { reverse = 1 })

set_hl(0, "Visual", { reverse = 1 })
set_hl(0, "VisualNOS", { reverse = 1 })
set_hl(0, "MatchParen", { bold = 1 })

set_hl(0, "ErrorMsg", { ctermfg = white, ctermbg = red })
set_hl(0, "WarningMsg", { ctermfg = white, ctermbg = yellow })

set_hl(0, "Search", { ctermfg = white, ctermbg = green })
set_hl(0, "IncSearch", { ctermfg = white, ctermbg = bright_green })

set_hl(0, "DiffAdd", { ctermbg = bright_green, ctermfg = black })
set_hl(0, "DiffChange", { ctermbg = bright_yellow, ctermfg = black })
set_hl(0, "DiffDelete", { ctermbg = bright_red, ctermfg = black })
set_hl(0, "DiffText", { ctermbg = yellow, ctermfg = black })

-- Suggested Group names (by Vim, see :h group-name)
reset("Comment")
reset("Constant")
reset("Identifier")
reset("Statement")
reset("PreProc")
reset("Type")
reset("Special")
reset("Underline")
reset("Ignore")
reset("Error")
reset("Todo")

-- Treesitter

reset("TSCharacter") -- Character literals: `'a'` in C.
reset("TSCharacterSpecial") -- Special characters.
reset("TSConstBuiltin") -- Built-in constant values: `nil` in Lua.
reset("TSConstMacro") -- Constants defined by macros: `NULL` in C.
reset("TSConstant") -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
reset("TSDanger") -- Text representation of a danger note.
reset("TSDefine") -- Preprocessor #define statements.
reset("TSEmphasis") -- Text to be represented with emphasis.
reset("TSEnvironment") -- Text environments of markup languages.
reset("TSEnvironmentName") -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
reset("TSError") -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
reset("TSField") -- Object and struct fields.
reset("TSFloat") -- Floating-point number literals.
reset("TSFuncBuiltin") -- Built-in functions: `print` in Lua.
reset("TSFuncMacro") -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
reset("TSFunction") -- Function definitions.
reset("TSFunctionCall") -- Function calls.
reset("TSLabel") -- GOTO labels: `label:` in C, and `::label::` in Lua.
reset("TSLiteral") -- Literal or verbatim text.
reset("TSMath") -- Math environments like LaTeX's `$ ... $`.
reset("TSMethod") -- Method definitions.
reset("TSMethodCall") -- Method calls.
reset("TSNamespace") -- Identifiers referring to modules and namespaces.
reset("TSNone") -- No highlighting (sets all highlight arguments to `NONE`). This group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
reset("TSNote") -- Text representation of an informational note.
reset("TSNumber") -- Numeric literals that don't fit into other categories.
reset("TSParameter") -- Parameters of a function.
reset("TSParameterReference") -- References to parameters of a function.
reset("TSPreProc") -- Preprocessor #if, #else, #endif, etc.
-- reset("TSProperty") -- Same as `TSField`.
reset("TSStrike") -- Strikethrough text.
reset("TSStringEscape") -- Escape characters within a string: `\n`, `\t`, etc.
reset("TSStringRegex") -- Regular expression literals.
reset("TSStringSpecial") -- Strings with special meaning that don't fit into the previous categories.
reset("TSStrong") -- Text to be represented in bold.
reset("TSSymbol") -- Identifiers referring to symbols or atoms.
reset("TSTag") -- Tags like HTML tag names.
reset("TSTagAttribute") -- HTML tag attributes.
reset("TSText") -- Non-structured text. Like text in a markup language.
reset("TSTextReference") -- Footnotes, text references, citations, etc.
reset("TSTitle") -- Text that is part of a title.
reset("TSURI") -- URIs like hyperlinks or email addresses.
reset("TSUnderline") -- Text to be represented with an underline.
reset("TSVariableBuiltin") -- Variable names defined by the language: `this` or `self` in Javascript.
reset("TSWarning") -- Text representation of a warning note.
reset("TSAttribute") -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.

set_hl(0, "TSConditional", { ctermfg = green, bold = 1 }) -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
set_hl(0, "TSDebug", { ctermfg = green, bold = 1 }) -- Debugging statements.
set_hl(0, "TSKeyword", { ctermfg = green, bold = 1 }) -- Keywords that don't fit into other categories.
set_hl(0, "TSKeywordFunction", { ctermfg = green, bold = 1 }) -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
set_hl(0, "TSKeywordOperator", { ctermfg = green, bold = 1 }) -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
set_hl(0, "TSKeywordReturn", { ctermfg = green, bold = 1 }) -- Keywords like `return` and `yield`.
set_hl(0, "TSException", { ctermfg = green, bold = 1 }) --  Exception related keywords: `try`, `except`, `finally` in Python.
set_hl(0, "TSRepeat", { ctermfg = green, bold = 1 }) -- Keywords related to loops: `for`, `while`, etc.
set_hl(0, "TSBoolean", { ctermfg = green, bold = 1 }) -- Boolean literals: `True` and `False` in Python.
set_hl(0, "TSStorageClass", { ctermfg = green, bold = 1 }) -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
set_hl(0, "TSInclude", { ctermfg = green, bold = 1 }) -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
set_hl(0, "TSTypeDefinition", { ctermfg = green, bold = 1 }) -- Type definitions, e.g. `typedef` in C.
set_hl(0, "TSTypeQualifier", { ctermfg = green, bold = 1 }) -- Qualifiers on types, e.g. `const` or `volatile` in C or `mut` in Rust.

set_hl(0, "TSComment", { ctermfg = bright_cyan, italic = 1 }) -- Line comments and block comments.

set_hl(0, "TSString", { ctermfg = red }) -- String literals.

set_hl(0, "TSType", { ctermfg = bright_blue, bold = 1 }) -- Type (and class) definitions and annotations.
set_hl(0, "TSTypeBuiltin", { ctermfg = bright_blue, bold = 1 }) -- Built-in types: `i32` in Rust.
set_hl(0, "TSConstructor", { ctermfg = bright_blue, bold = 1 }) -- Constructor calls and definitions: `{}` in Lua, and Java constructors.

set_hl(0, "TSVariable", { ctermfg = blue }) -- Variable names that don't fit into other categories.

set_hl(0, "TSOperator", { bold = 1 }) -- Binary or unary operators: `+`, and also `->` and `*` in C.
set_hl(0, "TSPunctBracket", { bold = 1 }) -- Brackets, braces, parentheses, etc.
set_hl(0, "TSPunctDelimiter", { bold = 1 }) -- Punctuation delimiters: Periods, commas, semicolons, etc.
set_hl(0, "TSPunctSpecial", { bold = 1 }) -- Special punctuation that doesn't fit into the previous categories.
set_hl(0, "TSTagDelimiter", { bold = 1 }) -- Tag delimiters like `<` `>` `/`.

set_hl(0, "TSTodo", { ctermfg = black, ctermbg = yellow }) -- Anything that needs extra attention, such as keywords like TODO or FIXME.

-- GitSigns (plugin)
set_hl(0, "GitSignsAdd", { ctermfg = bright_green })
set_hl(0, "GitSignsChange", { ctermfg = bright_yellow })
set_hl(0, "GitSignsDelete", { ctermfg = bright_red })
