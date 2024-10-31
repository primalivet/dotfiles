set background=dark
hi clear

if has('nvim')
        set notermguicolors
endif

let g:colors_name = "sixteen"

"  | SemanticType     | ANSI Color | Color Name (unreliable) |
"  | -----------------|------------|-------------------------|
"  | Foreground       | -          | -                       |
"  | Background       | -          | -                       |
"  | PopupBackground  | 8          | DarkGrey                |
"  | Keyword          | 3          | DarkYellow              |
"  | String           | 10         | LightGreen              |
"  | Comment          | 14         | LightCyan               |
"  | Type             | 7          | LightGrey               |
"  | Error            | 4          | DarkRed                 |
"  | Warning          | 6          | DarkYellow              |

hi   ColorColumn       NONE
hi   Conceal           NONE
hi   Cursor            NONE
hi   CursorColumn      NONE
hi   CursorIM          NONE
hi   CursorLine        NONE
hi   CursorLineFold    NONE
hi   CursorLineSign    NONE
hi   Directory         NONE
hi   Error             NONE
hi   ErrorMsg          NONE
hi   FoldColumn        NONE
hi   Ignore            NONE
hi   ModeMsg           NONE
hi   MoreMsg           NONE
hi   MsgArea           NONE
hi   MsgSeparator      NONE
hi   Normal            NONE
hi   Question          NONE
hi   SignColumn        NONE
hi   SpellBad          NONE
hi   SpellCap          NONE
hi   SpellLocal        NONE
hi   SpellRare         NONE
hi   Title             NONE
hi   Todo              NONE
hi   Underlined        NONE
hi   VisualNOS         NONE
hi   WarningMsg        NONE
hi   lCursor           NONE
hi   TabLineSel        NONE
hi   LineNr            NONE
hi   CursorLineNr      NONE
hi   LineNrAbove       NONE
hi   LineNrBelow       NONE
hi   Pmenu             ctermfg=0       ctermbg=7   cterm=NONE
hi   PmenuSel          ctermfg=15      ctermbg=4   cterm=NONE
hi!  link              PmenuSbar       Pmenu
hi!  link              PmenuThumb      Pmenu
hi   Search            ctermfg=15      ctermbg=4
hi!  link              IncSearch       Search
hi!  link              Substitute      Search
hi   NonText           ctermfg=13
hi!  link              EndOfBuffer     NonText
hi!  link              SpecialKey      NonText
hi   StatusLine        cterm=NONE      ctermfg=0   ctermbg=15
hi   StatusLineNC      cterm=NONE      ctermfg=0   ctermbg=7
hi   TabLine           ctermfg=NONE    ctermbg=8
hi   TabLineFill       ctermfg=8
hi   DiffAdd           ctermfg=NONE    ctermbg=22
hi   DiffChange        ctermfg=NONE    ctermbg=22
hi   DiffDelete        ctermfg=NONE    ctermbg=52
hi   DiffText          ctermfg=NONE    ctermbg=28
hi   MatchParen        cterm=reverse
hi   Visual            ctermfg=NONE    ctermbg=4
hi   QuickFixLine      ctermfg=0       ctermbg=2
hi   WildMenu          ctermfg=15      ctermbg=4
hi   Folded            ctermfg=NONE    ctermbg=8
hi   VertSplit         cterm=NONE      ctermfg=0   ctermbg=7
hi   Comment           ctermfg=14
hi   Constant          NONE
hi   String            ctermfg=10
hi!  link              Character       String
hi!  link              Number          Constant
hi!  link              Boolean         Constant
hi!  link              Float           Constant
hi   Identifier        NONE
hi!  link              Function        Identifier
hi   Statement         NONE
hi   Conditional       ctermfg=3
hi   Repeat            ctermfg=3
hi   Label             ctermfg=3
hi!  link              Operator        Normal
hi   Keyword           ctermfg=3
hi   Exception         ctermfg=3
hi   PreProc           NONE
hi!  link              Include         PreProc
hi!  link              Define          PreProc
hi!  link              Macro           PreProc
hi!  link              PreCondit       PreProc
hi   Type              ctermfg=7
hi!  link              StorageClass    Normal
hi!  link              Structure       Type
hi!  link              Typedef         Type
hi   Special           NONE
hi!  link              Tag             Special
hi!  link              Delimiter       Special
hi!  link              SpecialComment  Special
hi!  link              Debug           Special
hi!  link              Todo            Keyword
hi!  StatusLineTerm    ctermfg=0       ctermbg=10
hi!  StatusLineTermNC  ctermfg=0       ctermbg=2

if has('nvim')
        " Neovim highlight groups
        hi!  link         NormalNC      Normal
        hi   NormalFloat  ctermfg=NONE  ctermbg=8
        hi   FloatBorder  ctermfg=7
        hi!  link         FloatTitle    FloatNormal
        hi!  link         FloatFooter   FloatNormal
        hi!  link         MsgArea       Normal
        hi!  link         MsgSeparator  Normal
        hi!  link         Substitute    Search
        hi!  link         TermCursor    Cursor
        hi!  link         TermCursorNC  Cursor
        hi!  link         WinSeparator  VertSplit
        hi!  link         Whitespace    NonText
        hi!  link         WinBar        StatusLine
        hi!  link         WinBarNC      StatusLineNC
        hi!  link         CurSearch     Search

	" Mimic Vim's StatusLineTerm and StatusLineTermNC
        autocmd TermOpen,WinEnter * if &buftype=='terminal'
                                \|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
                                \|else|setlocal winhighlight=|endif


        " Neovim Diagnostics highlight groups (see :help Diagnostic-highlight)
        hi  DiagnosticError        ctermfg=1
        hi  DiagnosticWarn         ctermfg=3
        hi  DiagnosticInfo         ctermfg=6
        hi  DiagnosticHint         ctermfg=4
        hi  DiagnosticOk           ctermfg=2
        hi  DiagnosticDeprecated   ctermfg=1
        hi  DiagnosticUnnecessary  ctermfg=NONE

        " Neovim Lsp highlight groups (see :help lsp-highlight)
        " TODO: Update lsp-highlights
        hi!  link  LspReferenceText             Search
        hi!  link  LspReferenceRead             Search
        hi!  link  LspReferenceWrite            Search
        hi!  link  LspInlayHint                 NonText
        hi!  link  LspCodeLens                  NonText
        hi!  link  LspCodeLensSeparator         NonText
        hi!  link  LspSignatureActiveParameter  Search

        " Neovim Lsp Semantic highlights (see :help lsp-semantic-highlight)
        " TODO: Support lsp-semantic-highlight)
        " @lsp.type.class          Identifiers that declare or reference a class type
        " @lsp.type.comment        Tokens that represent a comment
        " @lsp.type.decorator      Identifiers that declare or reference decorators and annotations
        " @lsp.type.enum           Identifiers that declare or reference an enumeration type
        " @lsp.type.enumMember     Identifiers that declare or reference an enumeration property, constant, or member
        " @lsp.type.event          Identifiers that declare an event property
        " @lsp.type.function       Identifiers that declare a function
        " @lsp.type.interface      Identifiers that declare or reference an interface type
        " @lsp.type.keyword        Tokens that represent a language keyword
        " @lsp.type.macro          Identifiers that declare a macro
        " @lsp.type.method         Identifiers that declare a member function or method
        " @lsp.type.modifier       Tokens that represent a modifier
        " @lsp.type.namespace      Identifiers that declare or reference a namespace, module, or package
        " @lsp.type.number         Tokens that represent a number literal
        " @lsp.type.operator       Tokens that represent an operator
        " @lsp.type.parameter      Identifiers that declare or reference a function or method parameters
        " @lsp.type.property       Identifiers that declare or reference a member property, member field, or member variable
        " @lsp.type.regexp         Tokens that represent a regular expression literal
        " @lsp.type.string         Tokens that represent a string literal
        " @lsp.type.struct         Identifiers that declare or reference a struct type
        " @lsp.type.type           Identifiers that declare or reference a type that is not covered above
        " @lsp.type.typeParameter  Identifiers that declare or reference a type parameter
        " @lsp.type.variable       Identifiers that declare or reference a local or global variable
        "
        " @lsp.mod.abstract        Types and member functions that are abstract
        " @lsp.mod.async           Functions that are marked async
        " @lsp.mod.declaration     Declarations of symbols
        " @lsp.mod.defaultLibrary  Symbols that are part of the standard library
        " @lsp.mod.definition      Definitions of symbols, for example, in header files
        " @lsp.mod.deprecated      Symbols that should no longer be used
        " @lsp.mod.documentation   Occurrences of symbols in documentation
        " @lsp.mod.modification    Variable references where the variable is assigned to
        " @lsp.mod.readonly        Readonly variables and member fields (constants)
        " @lsp.mod.static          Class members (static members)

        " Neovim Treesitter highlights (see :help treesitter-highlight-groups)
        " TODO: Support treesitter-highlight-groups)
        " @variable                       various variable names
        " @variable.builtin               built-in variable names (e.g. `this`, `self`)
        " @variable.parameter             parameters of a function
        " @variable.parameter.builtin     special parameters (e.g. `_`, `it`)
        " @variable.member                object and struct fields
        "
        " @constant               constant identifiers
        " @constant.builtin       built-in constant values
        " @constant.macro         constants defined by the preprocessor
        "
        " @module                 modules or namespaces
        " @module.builtin         built-in modules or namespaces
        " @label                  `GOTO` and other labels (e.g. `label:` in C), including heredoc labels
        "
        " @string                 string literals
        " @string.documentation   string documenting code (e.g. Python docstrings)
        " @string.regexp          regular expressions
        " @string.escape          escape sequences
        " @string.special         other special strings (e.g. dates)
        " @string.special.symbol  symbols or atoms
        " @string.special.path    filenames
        " @string.special.url     URIs (e.g. hyperlinks)
        "
        " @character              character literals
        " @character.special      special characters (e.g. wildcards)
        "
        " @boolean                boolean literals
        " @number                 numeric literals
        " @number.float           floating-point number literals
        "
        " @type                   type or class definitions and annotations
        " @type.builtin           built-in types
        " @type.definition        identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
        "
        " @attribute              attribute annotations (e.g. Python decorators, Rust lifetimes)
        " @attribute.builtin      builtin annotations (e.g. `@property` in Python)
        " @property               the key in key/value pairs
        "
        " @function               function definitions
        " @function.builtin       built-in functions
        " @function.call          function calls
        " @function.macro         preprocessor macros
        "
        " @function.method        method definitions
        " @function.method.call   method calls
        "
        " @constructor            constructor calls and definitions
        " @operator               symbolic operators (e.g. `+`, `*`)
        "
        " @keyword                keywords not fitting into specific categories
        " @keyword.coroutine      keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
        " @keyword.function       keywords that define a function (e.g. `func` in Go, `def` in Python)
        " @keyword.operator       operators that are English words (e.g. `and`, `or`)
        " @keyword.import         keywords for including modules (e.g. `import`, `from` in Python)
        " @keyword.type           keywords defining composite types (e.g. `struct`, `enum`)
        " @keyword.modifier       keywords defining type modifiers (e.g. `const`, `static`, `public`)
        " @keyword.repeat         keywords related to loops (e.g. `for`, `while`)
        " @keyword.return         keywords like `return` and `yield`
        " @keyword.debug          keywords related to debugging
        " @keyword.exception      keywords related to exceptions (e.g. `throw`, `catch`)
        "
        " @keyword.conditional         keywords related to conditionals (e.g. `if`, `else`)
        " @keyword.conditional.ternary ternary operator (e.g. `?`, `:`)
        "
        " @keyword.directive           various preprocessor directives and shebangs
        " @keyword.directive.define    preprocessor definition directives
        "
        " @punctuation.delimiter  delimiters (e.g. `;`, `.`, `,`)
        " @punctuation.bracket    brackets (e.g. `()`, `{}`, `[]`)
        " @punctuation.special    special symbols (e.g. `{}` in string interpolation)
        "
        " @comment                line and block comments
        " @comment.documentation  comments documenting code
        "
        " @comment.error          error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
        " @comment.warning        warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
        " @comment.todo           todo-type comments (e.g. `TODO`, `WIP`)
        " @comment.note           note-type comments (e.g. `NOTE`, `INFO`, `XXX`)
        "
        " @markup.strong          bold text
        " @markup.italic          italic text
        " @markup.strikethrough   struck-through text
        " @markup.underline       underlined text (only for literal underline markup!)
        "
        " @markup.heading         headings, titles (including markers)
        " @markup.heading.1       top-level heading
        " @markup.heading.2       section heading
        " @markup.heading.3       subsection heading
        " @markup.heading.4       and so on
        " @markup.heading.5       and so forth
        " @markup.heading.6       six levels ought to be enough for anybody
        "
        " @markup.quote           block quotes
        " @markup.math            math environments (e.g. `$ ... $` in LaTeX)
        "
        " @markup.link            text references, footnotes, citations, etc.
        " @markup.link.label      link, reference descriptions
        " @markup.link.url        URL-style links
        "
        " @markup.raw             literal or verbatim text (e.g. inline code)
        " @markup.raw.block       literal or verbatim text as a stand-alone block
        "
        " @markup.list            list markers
        " @markup.list.checked    checked todo-style list markers
        " @markup.list.unchecked  unchecked todo-style list markers
        "
        " @diff.plus              added text (for diff files)
        " @diff.minus             deleted text (for diff files)
        " @diff.delta             changed text (for diff files)
        "
        " @tag                    XML-style tag names (e.g. in XML, HTML, etc.)
        " @tag.builtin            XML-style tag names (e.g. HTML5 tags)
        " @tag.attribute          XML-style tag attributes
        " @tag.delimiter          XML-style tag delimiters

        " hi!  link             @tag.attribute       NONE
        " hi   @tag             ctermfg=6
        " hi   @tag.builtin     ctermfg=6
        " hi   @tag.delimiter   ctermfg=6
        " hi!  link             @type.builtin        Type
        " hi   @type.builtin.c  ctermfg=7
        "
        " hi!  link             MiniDiffSignAdd      Normal
        " hi!  link             MiniDiffSignChange   Normal
        " hi!  link             MiniDiffSignDelete   Normal
endif
