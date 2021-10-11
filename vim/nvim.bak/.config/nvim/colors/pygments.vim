if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif


let colors_name = "pygments"

let s:none = ['NONE', 'NONE']
let s:bold = 'bold,'
let s:italic = 'italic,'
let s:underline = 'underline,'

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  execute join(histring, ' ')
endfunction

let g:use_beige = 1

let s:cs = {}

let  s:cs.grey1   =  ['#e9ecef',  0] " Terminal bg
let  s:cs.grey2   =  ['#dddddd',  0] " Terminal 7
let  s:cs.grey3   =  ['#cccccc',  0] " Terminal 8
let  s:cs.grey4   =  ['#bbbbbb',  0]

let  s:cs.beige1  =  ['#ebe4cc',  0] " Terminal bg
let  s:cs.beige2  =  ['#D4CDB8',  0] " Terminal 7
let  s:cs.beige3  =  ['#bcb6a3',  0] " Terminal 8
let  s:cs.beige4  =  ['#a5a08f',  0]

let  s:cs.black          =  ['#333333',  0] " Terminal 0
let  s:cs.blood_dark     =  ['#880000',  0] " Terminal 1
let  s:cs.green_dark     =  ['#008000',  0] " Terminal 2
" TODO 1 more yellow
let  s:cs.blue_dark      =  ['#000080',  0] " Terminal 4
let  s:cs.purple_dark    =  ['#800080',  0] " Terminal 5
let  s:cs.teal           =  ['#408080',  0] " Terminal 6

let  s:cs.lipstick  =  ['#BA2121',  0]  "  Terminal  9
let  s:cs.green     =  ['#00A000',  0]  "  Terminal  10
let  s:cs.yellow    =  ['#FFFF00',  0]  "  Terminal  11
let  s:cs.blue      =  ['#0000FF',  0]  "  Terminal  12
let  s:cs.purple    =  ['#AA22FF',  0]  "  Terminal  13
" TODO 1 more teal
let  s:cs.white     =  ['#f4f5f7',  0] " Terminal 15

" Extra
let  s:cs.red =  ['#FF0000',  0] " Terminal 9

let s:fg = s:cs.black

let s:elevation1_bg = s:cs.grey1
let s:elevation2_bg = s:cs.grey2
let s:elevation3_bg = s:cs.grey3
let s:elevation4_bg = s:cs.grey4

if g:use_beige == 1
  let s:elevation1_bg = s:cs.beige1
  let s:elevation2_bg = s:cs.beige2
  let s:elevation3_bg = s:cs.beige3
  let s:elevation4_bg = s:cs.beige4
endif

"------------------------------------------------------------------------------
" NORMAL
"------------------------------------------------------------------------------

call s:HL('Normal', s:fg, s:elevation1_bg)

"------------------------------------------------------------------------------
" SCHEME GROUPS
"------------------------------------------------------------------------------

call  s:HL('FuglyTeal',           s:cs.teal)
call  s:HL('FuglyTealItalic',     s:cs.teal,         s:none,  s:italic)

call  s:HL('FuglyGreen',          s:cs.green)
call  s:HL('FuglyGreenBold',      s:cs.green,        s:none,  s:bold)

call  s:HL('FuglyGreenDark',      s:cs.green_dark)
call  s:HL('FuglyGreenDarkBold',  s:cs.green_dark,   s:none,  s:bold)

call  s:HL('FuglyBlue',           s:cs.blue)
call  s:HL('FuglyBlueBold',       s:cs.blue,         s:none,  s:bold)

call  s:HL('FuglyBlueDark',       s:cs.blue_dark)
call  s:HL('FuglyBlueDarkBold',   s:cs.blue_dark,    s:none,  s:bold)

call  s:HL('FuglyRed',            s:cs.red)
call  s:HL('FuglyLipstick',       s:cs.lipstick)
call  s:HL('FuglyBloodDark',      s:cs.blood_dark)

call  s:HL('FuglyPurple',         s:cs.purple)
call  s:HL('FuglyPurpleBold',     s:cs.purple,       s:none,  s:bold)

call  s:HL('FuglyPurpleDark',     s:cs.purple_dark)

call  s:HL('FuglyYellow',         s:cs.yellow)

"------------------------------------------------------------------------------
" SCHEME ABSTRACT GROUPS
"------------------------------------------------------------------------------


call  s:HL('Elevation1',    s:fg,    s:elevation1_bg)
call  s:HL('Elevation1Bg',  s:none,  s:elevation1_bg)
call  s:HL('Elevation2',    s:fg,    s:elevation2_bg)
call  s:HL('Elevation2Bg',  s:none,  s:elevation2_bg)
call  s:HL('Elevation3',    s:fg,    s:elevation3_bg)
call  s:HL('Elevation3Bg',  s:none,  s:elevation3_bg)
call  s:HL('Elevation4',    s:fg,    s:elevation4_bg)
call  s:HL('Elevation4Bg',  s:none,  s:elevation4_bg)

call s:HL('FuglyForeground', s:fg, s:none)
call s:HL('FuglyForegroundBold', s:fg, s:none, s:bold)
call s:HL('FuglyNegative', s:elevation1_bg, s:fg)
call s:HL('FuglyNegativeBold', s:elevation1_bg, s:fg, s:bold)

"------------------------------------------------------------------------------
" BASE - UI
"------------------------------------------------------------------------------

" Line related
hi!  link  CursorLine    Elevation2Bg
hi!  link  Visual        Elevation2Bg
hi!  link  Folded        Elevation2Bg
hi!  link  StatusLine    FuglyNegativeBold
hi!  link  StatusLineNC  Elevation3
hi!  link  QuickFixLine  Elevation3

" Column related
hi!  link  LineNr        FuglyForeground
hi!  link  CursorLineNr  FuglyForegroundBold
hi!  link  SignColumn    Elevation1
hi!  link  FoldColumn    Elevation1

" Search
call s:HL('IncSearch', s:fg, s:cs.yellow)
call s:HL('Search', s:fg, s:cs.yellow)
call s:HL('Substitute', s:fg, s:cs.yellow)

" Diffs
hi!  link  DiffAdd     FuglyGreenDark
hi!  link  DiffChange  FuglyYellow
hi!  link  DiffDelete  FuglyRed
hi!  link  DiffText    FuglyYellow  "  TODO:  differantiate  from  DiffChange

" Messages
hi!  link  MsgArea       FuglyForeground
hi!  link  MsgSeparator  FuglyForeground
hi!  link  ModeMsg       FuglyForeground
hi!  link  MoreMsg       FuglyForeground
hi!  link  Error         FuglyRed
hi!  link  WarningMsg    FugleYellow
hi!  link  Question      FuglyForeground

" Popup and Floats
hi!  link  NormalFloat  Elevation2
hi!  link  Pmenu        Elevation3
hi!  link  PmenuSbar    Elevation3
hi!  link  PmenuThumb   Elevation4
hi!  link  PmenuSel     FuglyNegative

" Other
hi!  link  Whitespace   FuglyForeground
hi!  link  VertSplit    Elevation1
hi!  link  MatchParen   FuglyNegativeBold
hi!  link  Directory    FuglyForegroundBold
hi!  link  NonText      FuglyForeground
hi!  link  EndOfBuffer  NonText

" TODO: More groups, maybe just let them be
" TODO: check help highlight-group for more groups
" call s:HL('Cursor', s:cs.grey6, s:cs.grey0)
" call s:HL('CursorIM', s:cs.grey6, s:cs.grey0)
" call s:HL('TermCursor')
" call s:HL('TermCursorNC')
" call s:HL('Conceal', s:cs.grey6, s:cs.grey0)


"------------------------------------------------------------------------------
" BASE - SYNTAX
"------------------------------------------------------------------------------

hi! link Comment FuglyTealItalic

hi! link Constant FuglyForeground
hi! link String FuglyLipstick
hi! link Character String
hi! link Number FuglyForeground
hi! link Boolean FuglyGreenDarkBold
hi! link Float FuglyForeground

hi! link Identifier FuglyBlueDark " TS dont define generic identifier, overrides in TS
hi! link Function FuglyBlueDark

hi! link Statement FuglyForeground
hi! link Conditional FuglyGreenDarkBold
hi! link Repeat FuglyGreenDarkBold
hi! link Label FuglyForeground " Includes to much stuff, define in TS
hi! link Operator FuglyForegroundBold
hi! link Keyword FuglyGreenDarkBold
hi! link Exception FuglyGreenDarkBold

hi! link PreProc FuglyForeground
hi! link Include FuglyForegroundBold
hi! link Define FuglyForeground
hi! link Macro FuglyForeground
hi! link PreCondit FuglyForeground

hi! link Type FuglyForeground
hi! link StorageClass FuglyForeground
hi! link Structure FuglyForeground
hi! link Typedef FuglyForeground

hi! link Special FuglyForeground
hi! link SpecialChar FuglyForeground
hi! link Tag FuglyForegroundBold
hi! link Delimiter FuglyForeground
hi! link SpecialComment FuglyForeground
hi! link Debug FuglyForeground

hi Ignore cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE

hi Underlined cterm=underline gui=underline

hi! link Todo FuglyForeground

hi! link Error FuglyRed

"------------------------------------------------------------------------------
" TREESITTER
"------------------------------------------------------------------------------

" TREESITTER  - INHERIT SAME

hi! link TSBoolean Boolean " Boolean literals: True and False in Python.
hi! link TSCharacter Character " Character literals: 'a' in C.
hi! link TSComment Comment " Line comments and block comments.
hi! link TSConditional Conditional " Keywords related to conditionals: if, when, cond, etc.
hi! link TSConstant Constant " Constants identifiers. These might not be semantically constant.  " E.g. uppercase variables in Python.
hi! link TSError Error " Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
hi! link TSFloat Float " Floating-point number literals.
hi! link TSFunction Function " Function calls and definitions.
hi! link TSInclude Include " File or module inclusion keywords: #include in C, use or extern crate in Rust.
hi! link TSKeyword Keyword  " Keywords that don't fit into other categories.
hi! link TSNumber Number " Numeric literals that don't fit into other categories.
hi! link TSOperator Operator " Binary or unary operators: +, and also -> and * in C.
hi! link TSRepeat Repeat " Keywords related to loops: for, while, etc.
hi! link TSString String " String literals.
hi! link TSStringEscape String " Escape characters within a string: \n, \t, etc.
hi! link TSStringRegex String " Regular expression literals.
hi! link TSStringSpecial String " Strings with special meaning that don't fit into the previous categories.
hi! link TSTitle Title " Text that is part of a title.
hi! link TSUnderline Underlined " Text to be represented with an underline.

" TREESITTER  - INHERIT FORGROUND

hi! link TSAttribute FuglyForeground " Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
hi! link TSConstructor FuglyForeground " Constructor calls and definitions: {} in Lua, and Java constructors.
hi! link TSEmphasis FuglyForeground " Text to be represented with emphasis.
hi! link TSEnvironment FuglyForeground " Text environments of markup languages.
hi! link TSEnvironmentName FuglyForeground " Text/string indicating the type of text environment. Like the name of a \\begin block in LaTeX.
hi! link TSField FuglyForeground " Object and struct fields.
hi! link TSFuncMacro FuglyForeground " Macro defined functions (calls and definitions): each macro_rules in Rust.
hi! link TSLabel FuglyForeground " GOTO labels: label: in C, and ::label:: in Lua.
hi! link TSLiteral FuglyForeground " Literal or verbatim text.
hi! link TSMath FuglyForeground " Math environments like LaTeX's $ ... $
hi! link TSMethod FuglyForeground " Method calls and definitions.
hi! link TSNamespace FuglyForeground " Identifiers referring to modules and namespaces.
hi! link TSParameter FuglyForeground " Parameters of a function.
hi! link TSParameterReference FuglyForeground " References to parameters of a function.
hi! link TSProperty TSField " Same as hi! link TSField.
hi! link TSPunctBracket FuglyForeground " Brackets, braces, parentheses, etc.
hi! link TSPunctDelimiter FuglyForeground " Punctuation delimiters: Periods, commas, semicolons, etc.
hi! link TSPunctSpecial FuglyForeground " Special punctuation that doesn't fit into the previous categories.
hi! link TSStrike FuglyForeground " Strikethrough text.
hi! link TSStrong FuglyForeground " Text to be represented in bold.
hi! link TSSymbol FuglyForeground " Identifiers referring to symbols or atoms.
hi! link TSTag Tag " Tags like HTML tag names.
hi! link TSTagAttribute FuglyForeground " HTML tag attributes.
hi! link TSTagDelimiter FuglyForeground " Tag delimiters like < > /.
hi! link TSText FuglyForeground " " Non-structured text. Like text in a markup language.
hi! link TSTextReference FuglyForeground " Footnotes, text references, citations, etc.
hi! link TSURI FuglyForeground " URIs like hyperlinks or email addresses.

" TREESITTER  - OTHER

hi! link TSConstBuiltin Keyword " Built-in constant values: nil in Lua.
hi! link TSConstMacro Keyword " Constants defined by macros: NULL in C.
hi! link TSDanger ErrorMsg " Text representation of a danger note.
hi! link TSException Exception " Exception related keywords: try, except, finally in Python.
hi! link TSFuncBuiltin Function " Built-in functions: print in Lua.
hi! link TSKeywordFunction FuglyBlueBold " Keywords used to define a function: function in Lua, def and lambda in Python.
hi! link TSKeywordOperator FuglyGreenDarkBold " Unary and binary operators that are English words: and, or in Python; sizeof in C.
hi! link TSKeywordReturn FuglyGreenDarkBold " Keywords like return and yield.
hi! link TSNote Todo " Text representation of an informational note.
hi! link TSType FuglyBloodDark " Type (and class) definitions and annotations.
hi! link TSTypeBuiltin FuglyBloodDark " Built-in types: i32 in Rust.
hi! link TSVariable FuglyBlueDark " Variable names that don't fit into other categories.
hi! link TSVariableBuiltin FuglyGreenDarkBold " Variable names defined by the language: this or self in Javascript.
hi! link TSWarning WarningMsg" Text representation of a warning note.

" TREESITTER  - UNDEFINED

" hi! link TSNone
" No highlighting (sets all highlight arguments to NONE). this group is used
" to clear certain ranges, for example, string interpolations. Don't change the
" values of this highlight group.

"------------------------------------------------------------------------------
" TELESCOPE
"------------------------------------------------------------------------------

hi! link TelescopeNormal NormalFloat
hi! link TelescopeSelection Elevation3
hi! link TelescopeMultiSelection FuglyForegroundBold
hi! link TelescopePreviewNormal TelescopeNormal
hi! link TelescopeBorder TelescopeNormal
hi! link TelescopeMatching Search
hi! link TelescopePromptPrefix FuglyForeground
