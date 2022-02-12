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

"  hi  Normal          ctermfg=none  ctermbg=none
"  hi  SignColumn      ctermfg=none  ctermbg=none
"  hi  StatusLine      ctermfg=none  ctermbg=none
"  hi  StatusLineNC    ctermfg=none  ctermbg=none
hi  DiffAdd         ctermfg=10  ctermbg=2
hi  DiffChange      ctermfg=11  ctermbg=3
hi  DiffDelete      ctermfg=9  ctermbg=1
hi  DiffText        ctermfg=11  ctermbg=3 gui=bold
"  hi  ColorColumn     ctermfg=none  ctermbg=none
"  hi  Conceal         ctermfg=none  ctermbg=none
"  hi  Cursor          ctermfg=none  ctermbg=none
"  hi  CursorColumn    ctermfg=none  ctermbg=none
"  hi  CursorIM        ctermfg=none  ctermbg=none
" hi  CursorLine      ctermfg=none  ctermbg=gray20
" hi  CursorLineNr    ctermfg=yellow  ctermbg=none gui=bold
"  hi  Directory       ctermfg=none  ctermbg=none
"  hi  EndOfBuffer     ctermfg=none  ctermbg=none
"  hi  ErrorMsg        ctermfg=none  ctermbg=none
"  hi  FoldColumn      ctermfg=none  ctermbg=none
"  hi  Folded          ctermfg=none  ctermbg=none
"  hi  IncSearch       ctermfg=none  ctermbg=none
" hi  LineNr          ctermfg=darkyellow  ctermbg=none
"  hi  MatchParen      ctermfg=none  ctermbg=none
"  hi  ModeMsg         ctermfg=none  ctermbg=none
"  hi  MoreMsg         ctermfg=none  ctermbg=none
"  hi  MsgArea         ctermfg=none  ctermbg=none
"  hi  MsgSeparator    ctermfg=none  ctermbg=none
"  hi  NonText         ctermfg=none  ctermbg=none
"  hi  NormalFloat     ctermfg=none  ctermbg=none
"  hi  NormalNC        ctermfg=none  ctermbg=none
"  hi  Pmenu           ctermfg=none  ctermbg=none
"  hi  PmenuSbar       ctermfg=none  ctermbg=none
"  hi  PmenuSel        ctermfg=none  ctermbg=none
"  hi  PmenuThumb      ctermfg=none  ctermbg=none
"  hi  Question        ctermfg=none  ctermbg=none
"  hi  QuickFixLine    ctermfg=none  ctermbg=none
"  hi  Search          ctermfg=none  ctermbg=none
" hi  SignColumn      ctermfg=none  ctermbg=Grey
"  hi  SpecialKey      ctermfg=none  ctermbg=none
"  hi  SpellBad        ctermfg=none  ctermbg=none
"  hi  SpellCap        ctermfg=none  ctermbg=none
"  hi  SpellLocal      ctermfg=none  ctermbg=none
"  hi  SpellRare       ctermfg=none  ctermbg=none
"  hi  Substitute      ctermfg=none  ctermbg=none
"  hi  TabLine         ctermfg=none  ctermbg=none
"  hi  TabLineFill     ctermfg=none  ctermbg=none
"  hi  TabLineSel      ctermfg=none  ctermbg=none
"  hi  TermCursor      ctermfg=none  ctermbg=none
"  hi  TermCursorNC    ctermfg=none  ctermbg=none
"  hi  Title           ctermfg=none  ctermbg=none
"  hi  VertSplit       ctermfg=none  ctermbg=none
"  hi  Visual          ctermfg=none  ctermbg=none
"  hi  VisualNOS       ctermfg=none  ctermbg=none
"  hi  WarningMsg      ctermfg=none  ctermbg=none
"  hi  Whitespace      ctermfg=none  ctermbg=none
"  hi  WildMenu        ctermfg=none  ctermbg=none
"  hi  lCursor         ctermfg=none  ctermbg=none

" hi  Comment ctermfg=Green  gui=italic

" hi! Constant ctermfg=none ctermbg=none
" hi String ctermfg=LightCoral ctermbg=none
" hi Character ctermfg=DarkOrange ctermbg=none
" hi Number ctermfg=LightCoral ctermbg=none
" hi Boolean ctermfg=Yellow ctermbg=none
" hi Float ctermfg=Yellow ctermbg=none

" hi Identifier ctermfg=Silver gui=none
" hi Identifier ctermbg=none
" hi Function ctermbg=none

" hi Statement ctermfg=Yellow gui=bold
" hi Statement ctermbg=none
" hi Conditional ctermfg=13 ctermbg=none
" hi Repeat ctermfg=13 ctermbg=none
" hi Label ctermbg=none
" hi Operator ctermfg=5 ctermbg=none
" hi Keyword ctermfg=
" hi Exception ctermbg=none

" hi PreProc ctermfg=Silver
" hi PreProc ctermbg=none
" hi Include ctermbg=none
" hi Define ctermbg=none
" hi Macro ctermbg=none
" hi PreCondit ctermbg=none

" hi Type ctermfg=Lime gui=bold
" hi Type ctermbg=none
" hi StorageClass ctermbg=none
" hi Structure ctermbg=none
" hi Typedef ctermbg=none

" hi Special ctermfg=Fuchsia
" hi SpecialChar ctermbg=none
" hi Tag ctermbg=none
" hi Delimiter ctermfg=White
" hi SpecialComment ctermbg=none
" hi Debug ctermbg=none

" hi Underlined gui=underline
" hi Ignore ctermfg=none ctermbg=none gui=none
" hi Error ctermfg=Red ctermbg=none  gui=underline
" hi Todo ctermfg=Aqua ctermbg=none gui=none
"
"
"
"
"
