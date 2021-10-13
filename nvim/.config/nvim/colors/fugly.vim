" Vim color file
" Maintainer:
" Last Change:

hi clear Normal
set bg&

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "fugly"

"  hi  Normal          guifg=none  guibg=none
"  hi  SignColumn      guifg=none  guibg=none
"  hi  StatusLine      guifg=none  guibg=none
"  hi  StatusLineNC    guifg=none  guibg=none
 hi  DiffAdd         guifg=Black  guibg=Green
 hi  DiffChange      guifg=Black  guibg=Olive
 hi  DiffDelete      guifg=Black  guibg=Maroon
 hi  DiffText        guifg=Black  guibg=Olive gui=bold
"  hi  ColorColumn     guifg=none  guibg=none
"  hi  Conceal         guifg=none  guibg=none
"  hi  Cursor          guifg=none  guibg=none
"  hi  CursorColumn    guifg=none  guibg=none
"  hi  CursorIM        guifg=none  guibg=none
hi  CursorLine      guifg=none  guibg=gray20
hi  CursorLineNr    guifg=yellow  guibg=none gui=bold
"  hi  Directory       guifg=none  guibg=none
"  hi  EndOfBuffer     guifg=none  guibg=none
"  hi  ErrorMsg        guifg=none  guibg=none
"  hi  FoldColumn      guifg=none  guibg=none
"  hi  Folded          guifg=none  guibg=none
"  hi  IncSearch       guifg=none  guibg=none
hi  LineNr          guifg=darkyellow  guibg=none
"  hi  MatchParen      guifg=none  guibg=none
"  hi  ModeMsg         guifg=none  guibg=none
"  hi  MoreMsg         guifg=none  guibg=none
"  hi  MsgArea         guifg=none  guibg=none
"  hi  MsgSeparator    guifg=none  guibg=none
"  hi  NonText         guifg=none  guibg=none
"  hi  NormalFloat     guifg=none  guibg=none
"  hi  NormalNC        guifg=none  guibg=none
"  hi  Pmenu           guifg=none  guibg=none
"  hi  PmenuSbar       guifg=none  guibg=none
"  hi  PmenuSel        guifg=none  guibg=none
"  hi  PmenuThumb      guifg=none  guibg=none
"  hi  Question        guifg=none  guibg=none
"  hi  QuickFixLine    guifg=none  guibg=none
"  hi  Search          guifg=none  guibg=none
hi  SignColumn      guifg=none  guibg=Grey
"  hi  SpecialKey      guifg=none  guibg=none
"  hi  SpellBad        guifg=none  guibg=none
"  hi  SpellCap        guifg=none  guibg=none
"  hi  SpellLocal      guifg=none  guibg=none
"  hi  SpellRare       guifg=none  guibg=none
"  hi  Substitute      guifg=none  guibg=none
"  hi  TabLine         guifg=none  guibg=none
"  hi  TabLineFill     guifg=none  guibg=none
"  hi  TabLineSel      guifg=none  guibg=none
"  hi  TermCursor      guifg=none  guibg=none
"  hi  TermCursorNC    guifg=none  guibg=none
"  hi  Title           guifg=none  guibg=none
"  hi  VertSplit       guifg=none  guibg=none
"  hi  Visual          guifg=none  guibg=none
"  hi  VisualNOS       guifg=none  guibg=none
"  hi  WarningMsg      guifg=none  guibg=none
"  hi  Whitespace      guifg=none  guibg=none
"  hi  WildMenu        guifg=none  guibg=none
"  hi  lCursor         guifg=none  guibg=none

hi  Comment guifg=Green  gui=italic

hi! Constant guifg=none guibg=none
hi String guifg=LightCoral guibg=none
hi Character guifg=DarkOrange guibg=none
hi Number guifg=LightCoral guibg=none
hi Boolean guifg=Yellow guibg=none
hi Float guifg=Yellow guibg=none

hi Identifier guifg=Silver gui=none
" hi Identifier ctermbg=none
" hi Function ctermbg=none

hi Statement guifg=Yellow gui=bold
" hi Statement ctermbg=none
" hi Conditional ctermfg=13 ctermbg=none
" hi Repeat ctermfg=13 ctermbg=none
" hi Label ctermbg=none
" hi Operator ctermfg=5 ctermbg=none
" hi Keyword guifg=
" hi Exception ctermbg=none

hi PreProc guifg=Silver
" hi PreProc ctermbg=none
" hi Include ctermbg=none
" hi Define ctermbg=none
" hi Macro ctermbg=none
" hi PreCondit ctermbg=none

hi Type guifg=Lime gui=bold
" hi Type ctermbg=none
" hi StorageClass ctermbg=none
" hi Structure ctermbg=none
" hi Typedef ctermbg=none

hi Special guifg=Fuchsia
" hi SpecialChar ctermbg=none
" hi Tag ctermbg=none
hi Delimiter guifg=White
" hi SpecialComment ctermbg=none
" hi Debug ctermbg=none

hi Underlined gui=underline
hi Ignore guifg=none guibg=none gui=none
hi Error guifg=Red guibg=none  gui=underline
hi Todo guifg=Aqua guibg=none gui=none
