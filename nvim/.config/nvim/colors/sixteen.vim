hi clear

if has('nvim')
  set notermguicolors
endif

let g:colors_name = "sixteen"

" -----------------------------------------------------------------------------
"  Highlight groups
" -----------------------------------------------------------------------------

hi        Normal            NONE
hi! link  NormalNC          Normal
hi! link  NormalFloat       Normal
hi! link  FloatBorder       Normal
hi! link  FloatFooter   Normal
hi! link  FloatTitle    Normal

hi! link  Cursor            Normal
hi! link  CursorIM          Normal
hi! link  lCursor           Normal
hi! link  TermCursor        Normal
hi! link  TermCursorNC      Normal

hi! link  CursorLine        Normal
hi! link  CursorLineFold    Normal
hi! link  CursorLineSign    Normal

hi! link  ColorColumn       Normal
hi! link  CursorColumn      Normal

hi! link  ErrorMsg          Normal
hi! link  ModeMsg           Normal
hi! link  MoreMsg           Normal
hi! link  MsgArea           Normal
hi! link  MsgSeparator      Normal
hi! link  Question          Normal
hi! link  WarningMsg        Normal

hi! link  FoldColumn        Normal
hi! link  Folded            Normal

hi! link  Conceal           Normal
hi! link  Directory         Normal
hi! link  SignColumn        Normal
hi! link  Title             Normal
hi! link  SpecialKey        Normal
hi! link  Whitespace        Normal
hi! link  EndOfBuffer       Normal
hi! link  NonText           Normal

hi        LineNr            ctermfg=8     ctermbg=NONE  cterm=NONE
hi! link  LineNrAbove       LineNr
hi! link  LineNrBelow       LineNr
hi! link  CursorLineNr      LineNr

hi        DiffAdd           ctermfg=0     ctermbg=2     cterm=NONE
hi        DiffChange        ctermfg=0     ctermbg=2     cterm=NONE
hi        DiffDelete        ctermfg=0     ctermbg=1     cterm=NONE
hi        DiffText          ctermfg=0     ctermbg=2     cterm=NONE

hi        Pmenu             ctermfg=NONE  ctermbg=8     cterm=NONE
hi        PmenuSbar         ctermfg=NONE  ctermbg=8     cterm=NONE
hi        PmenuSel          ctermfg=0     ctermbg=3     cterm=NONE
hi        PmenuThumb        ctermfg=NONE  ctermbg=0     cterm=NONE

hi        SpellBad          ctermfg=1     ctermbg=NONE  cterm=underline
hi        SpellCap          ctermfg=1     ctermbg=NONE  cterm=underline
hi        SpellLocal        ctermfg=1     ctermbg=NONE  cterm=underline
hi        SpellRare         ctermfg=1     ctermbg=NONE  cterm=underline

hi        StatusLine        ctermfg=NONE     ctermbg=8    cterm=NONE
hi        StatusLineNC      ctermfg=NONE     ctermbg=8    cterm=NONE
hi        StatusLineTerm    ctermfg=NONE     ctermbg=8    cterm=NONE
hi        StatusLineTermNC  ctermfg=NONE     ctermbg=8    cterm=NONE
hi! link  WinBar            StatusLine
hi! link  WinBarNC          StatusLine

hi        TabLine           ctermfg=0     ctermbg=15    cterm=NONE
hi        TabLineFill       ctermfg=0     ctermbg=15    cterm=NONE
hi! link  TabLineSel        Normal

hi        Visual            ctermfg=15    ctermbg=4     cterm=NONE
hi! link  VisualNOS         Visual

hi        Search            ctermfg=0     ctermbg=3     cterm=NONE
hi        IncSearch         ctermfg=0     ctermbg=11    cterm=NONE
hi! link  CurSearch         IncSearch
hi! link  Substitute        Search

hi        MatchParen        ctermfg=0     ctermbg=2     cterm=NONE
hi        QuickFixLine      ctermfg=0     ctermbg=2     cterm=NONE
hi        VertSplit         ctermfg=0     ctermbg=15    cterm=NONE
hi        WildMenu          ctermfg=0     ctermbg=3     cterm=NONE


hi!  link  WinSeparator  VertSplit




" -----------------------------------------------------------------------------
" Group names
" -----------------------------------------------------------------------------

hi   Comment     ctermfg=6        ctermbg=NONE  cterm=italic

hi   Constant    NONE
hi   String      ctermfg=2
hi   Character   ctermfg=2
hi!  link        Number           Constant
hi!  link        Boolean          Constant
hi!  link        Float            Constant

hi   Identifier  NONE
hi   Function    ctermfg=11 ctermbg=NONE cterm=bold

hi   Statement   ctermfg=11 ctermbg=NONE cterm=bold

hi!  link        Conditional  Statement
hi!  link        Repeat       Statement
hi!  link        Label        Statement
hi!  Operator    NONE
hi!  link        Keyword      Statement
hi!  link        Exception    Statement

hi   PreProc     ctermfg=11 ctermbg=NONE cterm=bold
hi!  link        Include          PreProc
hi!  link        Define           PreProc
hi!  link        Macro            PreProc
hi!  link        PreCondit        PreProc

hi   Type        NONE
hi!  link        StorageClass     Normal
hi!  link        Structure        Type
hi!  link        Typedef          Type

hi   Special     NONE
hi!  link        SpecialChar      Special
hi   link        Tag              Special
hi!  link        Delimiter        Special
hi!  link        SpecialComment   Special
hi!  link        Debug            Special

hi   Underlined  cterm=underline

hi   Ignore      NONE

hi   Error       ctermfg=1        ctermbg=NONE

hi!  Todo        ctermfg=0        ctermbg=3

hi!  link        Added            DiffAdd
hi!  link        Changed          DiffText
hi!  link        Removed          DiffDelete


" -----------------------------------------------------------------------------
" Diagnostic highlights
" -----------------------------------------------------------------------------

hi  DiagnosticError           ctermfg=1
hi  DiagnosticWarn            ctermfg=3
hi  DiagnosticInfo            ctermfg=6
hi  DiagnosticHint            ctermfg=4
hi  DiagnosticOk              ctermfg=2
hi  DiagnosticDeprecated      ctermfg=1
hi  DiagnosticUnnecessary     ctermfg=NONE

hi  DiagnosticUnderlineError  ctermfg=1     cterm=underline
hi  DiagnosticUnderlineWarn   ctermfg=3     cterm=underline
hi  DiagnosticUnderlineInfo   ctermfg=6     cterm=underline
hi  DiagnosticUnderlineHint   ctermfg=4     cterm=underline
hi  DiagnosticUnderlineOk     ctermfg=2     cterm=underline

" -----------------------------------------------------------------------------
" LSP highlights
" -----------------------------------------------------------------------------

hi!  link  LspReferenceText             Search
hi!  link  LspReferenceRead             Search
hi!  link  LspReferenceWrite            Search
hi!  link  LspInlayHint                 Comment
hi!  link  LspCodeLens                  NonText
hi!  link  LspCodeLensSeparator         NonText
hi!  link  LspSignatureActiveParameter  Search

" -----------------------------------------------------------------------------
" Treesitter highlights
" -----------------------------------------------------------------------------

if has('nvim')
  hi! link @variable                    Identifier           " various variable names
  hi! link @variable.builtin            Identifier           " built-in variable names (e.g. `this`, `self`)
  hi! link @variable.parameter          Identifier           " parameters of a function
  hi! link @variable.parameter.builtin  Identifier           " special parameters (e.g. `_`, `it`)
  hi! link @variable.member             Identifier           " object and struct fields

  hi! link @constant                    Constant             " constant identifiers
  hi! link @constant.builtin            Constant             " built-in constant values
  hi! link @constant.macro              Constant             " constants defined by the preprocessor

  hi! link @module                      PreProc              " modules or namespaces
  hi! link @module.builtin              PreProc              " built-in modules or namespaces
  hi! link @label                       Label                " `GOTO` and other labels (e.g. `label:` in C), including heredoc labels

  hi! link @string                      String               " string literals
  hi! link @string.documentation        String               " string documenting code (e.g. Python docstrings)
  hi! link @string.regexp               Character            " regular expressions
  hi! link @string.escape               Character            " escape sequences
  hi! link @string.special              Character            " other special strings (e.g. dates)
  hi! link @string.special.symbol       Character            " symbols or atoms
  hi! link @string.special.path         Character            " filenames
  hi! link @string.special.url          Character            " URIs (e.g. hyperlinks)

  hi! link @character                   Character            " character literals
  hi! link @character.special           Character            " special characters (e.g. wildcards)

  hi! link  @boolean                    Constant             " boolean literals
  hi! link  @number                     Constant             " numeric literals
  hi! link  @number.float               Constant             " floating-point number literals

  hi! link @type                        Type                 " type or class definitions and annotations
  hi! link @type.builtin                Type                 " built-in types
  hi! link @type.definition             Type                 " identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

  hi! link @attribute                    Constant            " attribute annotations (e.g. Python decorators, Rust lifetimes)
  hi! link @attribute.builtin            Constant            " builtin annotations (e.g. `@property` in Python)
  hi! link @property                     Identifier          " the key in key/value pairs

  hi! link @function                     Identifier          " function definitions
  hi! link @function.builtin             Identifier          " built-in functions
  hi! link @function.call                Identifier          " function calls
  hi! link @function.macro               Identifier          " preprocessor macros

  hi! link @function.method              Identifier          " method definitions
  hi! link @function.method.call         Identifier          " method calls

  hi! link @constructor                  Identifier          " constructor calls and definitions
  hi! link @operator                     Operator            " symbolic operators (e.g. `+`, `*`)

  hi! link @keyword                      Keyword             " keywords not fitting into specific categories
  hi! link @keyword.coroutine            Keyword             " keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
  hi! link @keyword.function             Function            " keywords that define a function (e.g. `func` in Go, `def` in Python)
  hi! link @keyword.operator             Operator            " operators that are English words (e.g. `and`, `or`)
  hi! link @keyword.import               PreProc             " keywords for including modules (e.g. `import`, `from` in Python)
  hi! link @keyword.type                 Type                " keywords defining composite types (e.g. `struct`, `enum`)
  hi! link @keyword.modifier             Keyword             " keywords defining type modifiers (e.g. `const`, `static`, `public`)
  hi! link @keyword.repeat               Repeat              " keywords related to loops (e.g. `for`, `while`)
  hi! link @keyword.return               Keyword             " keywords like `return` and `yield`
  hi! link @keyword.debug                Keyword             " keywords related to debugging
  hi! link @keyword.exception            Exception             " keywords related to exceptions (e.g. `throw`, `catch`)

  hi! link @keyword.conditional          Conditional             " keywords related to conditionals (e.g. `if`, `else`)
  hi! link @keyword.conditional.ternary  Conditional             " ternary operator (e.g. `?`, `:`)

  hi! link @keyword.directive            Keyword             " various preprocessor directives and shebangs
  hi! link @keyword.directive.define     Keyword             " preprocessor definition directives

  hi! link @punctuation.delimiter        Delimiter           " delimiters (e.g. `;`, `.`, `,`)
  hi! link @punctuation.bracket          Delimiter           " brackets (e.g. `()`, `{}`, `[]`)
  hi! link @punctuation.special          Delimiter           " special symbols (e.g. `{}` in string interpolation)

  hi! link @comment                      Comment             " line and block comments
  hi! link @comment.documentation        Comment             " comments documenting code

  hi! link @comment.error                Todo                " error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
  hi! link @comment.warning              Todo                " warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
  hi! link @comment.todo                 Todo                " todo-type comments (e.g. `TODO`, `WIP`)
  hi! link @comment.note                 Todo                " note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

  hi @markup.strong                      cterm=bold          " bold text
  hi @markup.italic                      cterm=italic        " italic text
  hi @markup.strikethrough               cterm=strikethrough " struck-through text
  hi @markup.underline                   cterm=underline     " underlined text (only for literal underline markup!)

  hi! link @markup.heading               Normal              " headings, titles (including markers)
  hi! link @markup.heading.1             Normal              " top-level heading
  hi! link @markup.heading.2             Normal              " section heading
  hi! link @markup.heading.3             Normal              " subsection heading
  hi! link @markup.heading.4             Normal              " and so on
  hi! link @markup.heading.5             Normal              " and so forth
  hi! link @markup.heading.6             Normal              " six levels ought to be enough for anybody

  hi! link @markup.quote                 Normal              " block quotes
  hi! link @markup.math                  Normal              " math environments (e.g. `$ ... $` in LaTeX)


  hi @markup.link                        ctermfg=4 cterm=underline " text references, footnotes, citations, etc.
  hi! link @markup.link.label            Normal              " link, reference descriptions
  hi! link @markup.link.url              Normal              " URL-style links

  hi! link @markup.raw                   Normal              " literal or verbatim text (e.g. inline code)
  hi! link @markup.raw.block             Normal              " literal or verbatim text as a stand-alone block

  hi! link @markup.list                  Normal              " list markers
  hi! link @markup.list.checked          Normal              " checked todo-style list markers
  hi! link @markup.list.unchecked        Normal              " unchecked todo-style list markers

  hi! link @diff.plus                    Added               " added text (for diff files)
  hi! link @diff.minus                   Removed             " deleted text (for diff files)
  hi! link @diff.delta                   Changed             " changed text (for diff files)

  hi! link @tag                          Tag                 " XML-style tag names (e.g. in XML, HTML, etc.)
  hi! link @tag.builtin                  Tag                 " XML-style tag names (e.g. HTML5 tags)
  hi! link @tag.attribute                Tag                 " XML-style tag attributes
  hi! link @tag.delimiter                Tag                 " XML-style tag delimiters
endif

" -----------------------------------------------------------------------------
" LSP semantic highlights
" -----------------------------------------------------------------------------

if has('nvim')
  hi @lsp.type.class            ctermfg=NONE         " Identifiers that declare or reference a class type
  hi @lsp.type.comment          ctermfg=NONE         " Tokens that represent a comment
  hi @lsp.type.decorator        ctermfg=NONE         " Identifiers that declare or reference decorators and annotations
  hi @lsp.type.enum             ctermfg=NONE         " Identifiers that declare or reference an enumeration type
  hi @lsp.type.enumMember       ctermfg=NONE         " Identifiers that declare or reference an enumeration property, constant, or member
  hi @lsp.type.event            ctermfg=NONE         " Identifiers that declare an event property
  hi @lsp.type.function         ctermfg=NONE         " Identifiers that declare a function
  hi @lsp.type.interface        ctermfg=NONE         " Identifiers that declare or reference an interface type
  hi @lsp.type.keyword          ctermfg=NONE         " Tokens that represent a language keyword
  hi @lsp.type.macro            ctermfg=NONE         " Identifiers that declare a macro
  hi @lsp.type.method           ctermfg=NONE         " Identifiers that declare a member function or method
  hi @lsp.type.modifier         ctermfg=NONE         " Tokens that represent a modifier
  hi @lsp.type.namespace        ctermfg=NONE         " Identifiers that declare or reference a namespace, module, or package
  hi @lsp.type.number           ctermfg=NONE         " Tokens that represent a number literal
  hi @lsp.type.operator         ctermfg=NONE         " Tokens that represent an operator
  hi @lsp.type.parameter        ctermfg=NONE         " Identifiers that declare or reference a function or method parameters
  hi @lsp.type.property         ctermfg=NONE         " Identifiers that declare or reference a member property, member field, or member variable
  hi @lsp.type.regexp           ctermfg=NONE         " Tokens that represent a regular expression literal
  hi @lsp.type.string           ctermfg=NONE         " Tokens that represent a string literal
  hi @lsp.type.struct           ctermfg=NONE         " Identifiers that declare or reference a struct type
  hi @lsp.type.type             ctermfg=NONE         " Identifiers that declare or reference a type that is not covered above
  hi @lsp.type.typeParameter    ctermfg=NONE         " Identifiers that declare or reference a type parameter
  hi @lsp.type.variable         ctermfg=NONE         " Identifiers that declare or reference a local or global variable

  hi @lsp.mod.abstract          ctermfg=NONE         " Types and member functions that are abstract
  hi @lsp.mod.async             ctermfg=NONE         " Functions that are marked async
  hi @lsp.mod.declaration       ctermfg=NONE         " Declarations of symbols
  hi @lsp.mod.defaultLibrary    ctermfg=NONE         " Symbols that are part of the standard library
  hi @lsp.mod.definition        ctermfg=NONE         " Definitions of symbols, for example, in header files
  hi! link @lsp.mod.deprecated  DiagnosticDeprecated " Symbols that should no longer be used
  hi @lsp.mod.documentation     ctermfg=NONE         " Occurrences of symbols in documentation
  hi @lsp.mod.modification      ctermfg=NONE         " Variable references where the variable is assigned to
  hi @lsp.mod.readonly          ctermfg=NONE         " Readonly variables and member fields (constants)
  hi @lsp.mod.static            ctermfg=NONE         " Class members (static members)
endif

" -----------------------------------------------------------------------------
" GitSigns
" -----------------------------------------------------------------------------

hi GitSignsAdd ctermfg=10 ctermbg=NONE
hi GitSignsChange ctermfg=10 ctermbg=NONE
hi GitSignsDelete ctermfg=9 ctermbg=NONE

" -----------------------------------------------------------------------------
" FZF
" -----------------------------------------------------------------------------

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Normal'],
  \ 'fg+':     ['fg', 'Normal', 'Normal', 'Normal'],
  \ 'bg+':     ['bg', 'Normal', 'Normal'],
  \ 'hl+':     ['fg', 'Normal'],
  \ 'info':    ['fg', 'Normal'],
  \ 'border':  ['fg', 'Normal'],
  \ 'prompt':  ['fg', 'Normal'],
  \ 'pointer': ['fg', 'Normal'],
  \ 'marker':  ['fg', 'Normal'],
  \ 'spinner': ['fg', 'Normal'],
  \ 'header':  ['fg', 'Normal'] }

