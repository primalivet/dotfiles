hi clear

if has('nvim')
  set notermguicolors
endif

let g:colors_name = "turbo"

" -----------------------------------------------------------------------------
" Highlight groups (Clear)
" -----------------------------------------------------------------------------

hi   ColorColumn     NONE                                         " Used for the columns set with 'colorcolumn'.
hi   Conceal         NONE                                         " Placeholder characters substituted for concealed text (see 'conceallevel').
hi   CurSearch       ctermfg=0 ctermbg=34                         " Current match for the last search pattern (see 'hlsearch'). Note: This is correct after a search, but may get outdated if changes are made or the screen is redrawn.
hi   Cursor          NONE                                         " Character under the cursor. 
hi   lCursor         NONE                                         " Character under the cursor when |language-mapping| is used (see 'guicursor').
hi   CursorIM        NONE                                         " Like Cursor, but used when in IME mode.
hi   CursorColumn    NONE                                         " Screen-column at the cursor, when 'cursorcolumn' is set.
hi   CursorLine      NONE                                         " Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
hi   Directory       NONE                                         " Directory names (and other special names in listings).
hi   DiffAdd         ctermfg=46        ctermbg=22                 " Diff mode: Added line. |diff.txt|
hi   DiffChange      ctermfg=51        ctermbg=24                 " Diff mode: Changed line. |diff.txt|
hi   DiffDelete      ctermfg=197       ctermbg=52                 " Diff mode: Deleted line. |diff.txt|
hi!  link            DiffText          DiffChange                 " Diff mode: Changed text within a changed line. |diff.txt|
hi   EndOfBuffer     NONE                                         " Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
hi   TermCursor      NONE                                         " Cursor in a focused terminal.
hi   TermCursorNC    NONE                                         " Cursor in an unfocused terminal.
hi   ErrorMsg        NONE                                         " Error messages on the command line.
hi!  link            VertSplit         StatusLine                 " Separators between window splits (Vim)
hi!  link            WinSeparator      StatusLine                 " Separators between window splits.
hi   Folded          NONE                                         " Line used for closed folds.
hi   FoldColumn      NONE                                         " 'foldcolumn'
hi   SignColumn      ctermfg=255       ctermbg=17                 " Column where |signs| are displayed.
hi   IncSearch       ctermfg=0         ctermbg=34                 " 'incsearch' highlighting; also used for the text replaced with ":s///c".
hi   Substitute      NONE                                         " |:substitute| replacement text highlighting.
hi   LineNr          NONE                                         " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
hi   LineNrAbove     NONE                                         " Line number for when the 'relativenumber' option is set, above the cursor line.
hi   LineNrBelow     NONE                                         " Line number for when the 'relativenumber' option is set, below the cursor line.
hi   CursorLineNr    NONE                                         " Like LineNr when 'cursorline' is set and 'cursorlineopt' contains "number" or is "both", for the cursor line.
hi   CursorLineFold  NONE                                         " Like FoldColumn when 'cursorline' is set for the cursor line.
hi   CursorLineSign  NONE                                         " Like SignColumn when 'cursorline' is set for the cursor line.
hi   MatchParen      cterm=reverse                                " Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
hi   ModeMsg         NONE                                         " 'showmode' message (e.g., "-- INSERT --").
hi   MsgArea         ctermfg=18        ctermbg=30                 " Area for messages and command-line, see also 'cmdheight'.
hi   MsgSeparator    NONE                                         " Separator for scrolled messages |msgsep|.
hi   MoreMsg         NONE                                         " |more-prompt|
hi!  link            NonText           Normal                     " '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
hi   Normal          ctermfg=255       ctermbg=18                 " Normal text.
hi   NormalFloat     ctermfg=0         ctermbg=248                " Normal text in floating windows.
hi   FloatBorder     ctermfg=0         ctermbg=248                " Border of floating windows.
hi   FloatTitle      NONE                                         " Title of floating windows.
hi   FloatFooter     NONE                                         " Footer of floating windows.
hi!  link            NormalNC          Normal                     " Normal text in non-current windows.
hi   Pmenu           ctermfg=0         ctermbg=248     cterm=NONE   " Popup menu: Normal item.
hi   PmenuSel        ctermfg=0         ctermbg=34    cterm=NONE   " Popup menu: Selected item. Combined with |hl-Pmenu|.
hi!  link            PmenuKind         Pmenu                      " Popup menu: Normal item "kind".
hi!  link            PmenuKindSel      PmenuSel                   " Popup menu: Selected item "kind".
hi!  link            PmenuExtra        Pmenu                      " Popup menu: Normal item "extra text".
hi!  link            PmenuExtraSel     PmenuSel                   " Popup menu: Selected item "extra text".
hi   PmenuSbar       ctermfg=0         ctermbg=7                  " Popup menu: Scrollbar.
hi   PmenuThumb      ctermfg=0         ctermbg=8                  " Popup menu: Thumb of the scrollbar.
hi   PmenuMatch      ctermfg=124       ctermbg=NONE  cterm=NONE   " Popup menu: Matched text in normal item. Combined with |hl-Pmenu|.
hi!  link            PmenuMatchSel     PmenuSel                   " Popup menu: Matched text in selected item. Combined with |hl-PmenuMatch| and |hl-PmenuSel|.
hi   Question        NONE                                         " |hit-enter| prompt and yes/no questions.
hi   QuickFixLine    ctermfg=122                     ctermbg=34   " Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
hi   Search          ctermfg=0                       ctermbg=226  " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
hi   SnippetTabstop  NONE                                         " Tabstops in snippets. |vim.snippet|
hi   SpecialKey      NONE                                         " Unprintable characters: Text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
hi   SpellBad        NONE                                         " Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
hi   SpellCap        NONE                                         " Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
hi   SpellLocal      NONE                                         " Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
hi   SpellRare       NONE                                         " Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
hi   StatusLine      ctermfg=0         ctermbg=248   cterm=NONE   " Status line of current window.
hi!  link            StatusLineNC      StatusLine                 " Status lines of not-current windows.
hi!  link            StatusLineTerm    StatusLine                 " Status line of |terminal| window.
hi!  link            StatusLineTermNC  StatusLine                 " Status line of non-current |terminal| windows.
hi   TabLine         ctermfg=0         ctermbg=248                " Tab pages line, not active tab page label.
hi   TabLineFill     ctermfg=NONE      ctermbg=248                " Tab pages line, where there are no labels.
hi   TabLineSel      ctermfg=124       ctermbg=248                " Tab pages line, active tab page label.
hi   Title           NONE                                         " Titles for output from ":set all", ":autocmd" etc.
hi   Visual          ctermfg=18        ctermbg=250                " Visual mode selection.
hi!  link            VisualNOS         Visual                     " Visual mode selection when vim is "Not Owning the Selection".
hi   WarningMsg      NONE                                         " Warning messages.
hi   Whitespace      NONE                                         " "nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'.
hi   WildMenu        ctermfg=0         ctermbg=34    cterm=NONE   " Current match in 'wildmenu' completion.
hi   WinBar          NONE                                         " Window bar of current window.
hi   WinBarNC        NONE                                         " Window bar of not-current windows.

" -----------------------------------------------------------------------------
" Autocommands
" -----------------------------------------------------------------------------
"autocmd TermOpen,WinEnter * if &buftype=='terminal'
"      \|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
"      \|else|setlocal winhighlight=|endif

" filetype qf is both quickfix and location lists
augroup TurboAutoCommands
		autocmd!
		autocmd FileType fzf setlocal winhighlight=Normal:StatusLine
		autocmd FileType qf setlocal winhighlight=Normal:MsgArea
augroup END

" -----------------------------------------------------------------------------
" Group names
" -----------------------------------------------------------------------------

hi   Comment           ctermfg=37

hi   Constant    ctermfg=255
hi   String      ctermfg=40
hi   Character   ctermfg=48
hi!  link        Number           Constant
hi!  link        Boolean          Constant
hi!  link        Float            Constant

hi   Identifier  ctermfg=255
hi   Function    ctermfg=226

hi   Statement   ctermfg=226
hi!  link        Conditional  Statement
hi!  link        Repeat       Statement
hi!  link        Label        Statement
hi   Operator    ctermfg=255
hi!  link        Keyword      Statement
hi!  link        Exception    Statement

hi   PreProc     ctermfg=226
hi!  link        Include          PreProc
hi!  link        Define           PreProc
hi!  link        Macro            PreProc
hi!  link        PreCondit        PreProc

hi   Type        ctermfg=248
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

hi   Error       ctermfg=196        ctermbg=NONE cterm=UNDERLINE

hi!  Todo        ctermfg=0        ctermbg=226

hi!  link        Added            DiffAdd
hi!  link        Changed          DiffText
hi!  link        Removed          DiffDelete


" -----------------------------------------------------------------------------
" Diagnostic highlights
" -----------------------------------------------------------------------------

hi   DiagnosticError            ctermfg=197     ctermbg=52
hi   DiagnosticWarn             ctermfg=227     ctermbg=58
hi   DiagnosticInfo             ctermfg=51      ctermbg=24
hi   DiagnosticHint             ctermfg=51      ctermbg=24
hi   DiagnosticOk               ctermfg=46      ctermbg=22
hi!  link DiagnosticDeprecated  DiagnosticWarn
hi!  link DiagnosticUnnecess    DiagnosticWarn

hi   DiagnosticUnderlineError   ctermfg=197     cterm=underline
hi   DiagnosticUnderlineWarn    ctermfg=227     cterm=underline
hi   DiagnosticUnderlineInfo    ctermfg=51      cterm=underline
hi   DiagnosticUnderlineHint    ctermfg=51      cterm=underline
hi   DiagnosticUnderlineOk      ctermfg=46      cterm=underline

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
  hi! link @keyword.exception            Exception           " keywords related to exceptions (e.g. `throw`, `catch`)

  hi! link @keyword.conditional          Conditional         " keywords related to conditionals (e.g. `if`, `else`)
  hi! link @keyword.conditional.ternary  Conditional         " ternary operator (e.g. `?`, `:`)

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


  hi! link @markup.link                  Underlined          " text references, footnotes, citations, etc.
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
" FZF
" -----------------------------------------------------------------------------

augroup Turbo_FZF
augroup END

let g:fzf_colors =
\ { 'fg':      ['fg', 'Pmenu'],
  \ 'bg':      ['bg', 'Pmenu'],
  \ 'hl':      ['fg', 'PmenuMatch'],
  \ 'fg+':     ['fg', 'PmenuSel'],
  \ 'bg+':     ['bg', 'PmenuSel'],
  \ 'hl+':     ['fg', 'PmenuSel'],
  \ 'info':    ['fg', 'StatusLine'],
  \ 'border':  ['fg', 'StatusLine'],
  \ 'prompt':  ['fg', 'StatusLine'],
  \ 'pointer': ['fg', 'StatusLine'],
  \ 'marker':  ['fg', 'StatusLine'],
  \ 'spinner': ['fg', 'StatusLine'],
  \ 'header':  ['fg', 'StatusLine'] }
