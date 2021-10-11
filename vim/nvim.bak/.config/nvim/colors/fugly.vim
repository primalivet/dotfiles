" Vim color file
" Maintainer:
" Last Change:

"Normal  Bright
"Black   0       8
"Red     1       9
"Green   2       10
"Yellow  3       11
"Blue    4       12
"Purple  5       13
"Cyan    6       14
"White   7       15
" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "fugly"

let s:none = ['NONE', 'NONE']
let s:bold = 'bold,'
let s:italic = 'italic,'

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

let s:cs = {}

let  s:cs.black          =  ['Black',          0]
let  s:cs.red            =  ['DarkRed',        1]
let  s:cs.green          =  ['DarkGreen',      2]
let  s:cs.yellow         =  ['DarkYellow',     3]
let  s:cs.blue           =  ['DarkBlue',       4]
let  s:cs.magentan       =  ['Magentan',       5]
let  s:cs.cyan           =  ['DarkCyan',           6]
let  s:cs.lightgrey      =  ['LightGray',      7]
let  s:cs.grey           =  ['Gray',       8]
let  s:cs.lightred       =  ['LightRed',       9]
let  s:cs.lightgreen     =  ['LightGreen',     10]
let  s:cs.lightyellow    =  ['LightYellow',    11]
let  s:cs.lightblue      =  ['LightBlue',      12]
let  s:cs.lightmagentan  =  ['LightMagentan',  13]
let  s:cs.lightcyan      =  ['LightCyan',      14]
let  s:cs.white          =  ['White',          15]

" normal text
call s:HL('Normal', s:cs.white, s:cs.black)

" Columns
call s:HL('SignColumn', s:none, s:cs.grey)

" Diffs
call s:HL('DiffAdd', s:cs.green, s:cs.grey)
call s:HL('DiffChange', s:cs.yellow, s:cs.grey)
call s:HL('DiffDelete', s:cs.red, s:cs.grey)
call s:HL('DiffText', s:cs.yellow, s:cs.grey) " TODO: differantiate from DiffChange

" Statusline
call s:HL('StatusLine', s:cs.black, s:cs.lightgrey)
call s:HL('StatusLineNC', s:cs.black, s:cs.grey)

" Lines
call s:HL('LineNr', s:cs.yellow, s:none)
call s:HL('CursorLine', s:none, s:none)


" hi ColorColumn	ctermfg=none ctermbg=none cterm=none guifg=none guibg=none gui=none
" hi Conceal		ctermfg=none ctermbg=none " placeholder characters substituted for concealed text (see 'conceallevel')
" hi Cursor		ctermfg=none ctermbg=none " character under the cursor
" hi CursorColumn	ctermfg=none ctermbg=none " Screen-column at the cursor, when 'cursorcolumn' is set.
" hi CursorIM	ctermfg=none ctermbg=none " like Cursor, but used when in IME mode |CursorIM|
" hi CursorLine	ctermfg=none ctermbg=none cterm=underline " Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR ctermfg) is not set.
" hi CursorLineNr	ctermfg=none ctermbg=none " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
" hi Directory	ctermfg=none ctermbg=none " directory names (and other special names in listings)
" hi EndOfBuffer	ctermfg=none ctermbg=none " filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
" hi ErrorMsg	ctermfg=none ctermbg=none " error messages on the command line
" hi FoldColumn	ctermfg=none ctermbg=none " 'foldcolumn'
" hi Folded		ctermfg=none ctermbg=none " line used for closed folds
" hi IncSearch	ctermfg=none ctermbg=none " 'incsearch' highlighting; also used for the text replaced with ":s///c"
" hi LineNr		ctermfg=0 ctermbg=8 " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
" hi MatchParen	ctermfg=none ctermbg=none " The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
" hi ModeMsg		ctermfg=none ctermbg=none " 'showmode' message (e.g., "-- INSERT --")
" hi MoreMsg		ctermfg=none ctermbg=none " |more-prompt|
" hi MsgArea		ctermfg=none ctermbg=none " Area for messages and cmdline
" hi MsgSeparator	ctermfg=none ctermbg=none " Separator for scrolled messages, `msgsep` flag of 'display'
" hi NonText		ctermfg=none ctermbg=none " '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
" hi NormalFloat	ctermfg=none ctermbg=none " Normal text in floating windows.
" hi NormalNC	ctermfg=none ctermbg=none " normal text in non-current windows
" hi Pmenu		ctermfg=none ctermbg=none " Popup menu: normal item.
" hi PmenuSbar	ctermfg=none ctermbg=none " Popup menu: scrollbar.
" hi PmenuSel	ctermfg=none ctermbg=none " Popup menu: selected item.
" hi PmenuThumb	ctermfg=none ctermbg=none " Popup menu: Thumb of the scrollbar.
" hi Question	ctermfg=none ctermbg=none " |hit-enter| prompt and yes/no questions
" hi QuickFixLine	ctermfg=none ctermbg=none " Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
" hi Search		ctermfg=none ctermbg=none " Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
" hi SignColumn	ctermfg=7 ctermbg=8 " column where |signs| are displayed
" hi SpecialKey	ctermfg=none ctermbg=none " Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
" hi SpellBad	ctermfg=none ctermbg=none " Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
" hi SpellCap	ctermfg=none ctermbg=none " Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
" hi SpellLocal	ctermfg=none ctermbg=none " Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
" hi SpellRare	ctermfg=none ctermbg=none " Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
" hi Substitute	ctermfg=none ctermbg=none " |:substitute| replacement text highlighting
" hi TabLine		ctermfg=none ctermbg=none " tab pages line, not active tab page label
" hi TabLineFill	ctermfg=none ctermbg=none " tab pages line, where there are no labels
" hi TabLineSel	ctermfg=none ctermbg=none " tab pages line, active tab page label
" hi TermCursor	ctermfg=none ctermbg=none " cursor in a focused terminal
" hi TermCursorNC	ctermfg=none ctermbg=none " cursor in an unfocused terminal
" hi Title		ctermfg=none ctermbg=none " titles for output from ":set all", ":autocmd" etc.
" hi VertSplit	ctermfg=8 ctermbg=8 " the column separating vertically split windows
" hi Visual		ctermfg=0 ctermbg=3 " Visual mode selection
" hi VisualNOS	ctermfg=none ctermbg=none " Visual mode selection when vim is "Not Owning the Selection".
" hi WarningMsg	ctermfg=none ctermbg=none " warning messages
" hi Whitespace	ctermfg=8 ctermbg=none " "nbsp", "space", "tab" and "trail" in 'listchars'
" hi WildMenu	ctermfg=none ctermbg=none " current match in 'wildmenu' completion
" hi lCursor		ctermfg=none ctermbg=none " the character under the cursor when |language-mapping| is used (see 'ctermcursor')

call s:HL('Comment', s:cs.cyan)

hi! link Constant Normal
call s:HL('String', s:cs.lightgreen)
" hi Character ctermfg=2 ctermbg=none	" a character constant: 'c', '\n'
" hi Number ctermfg=6 ctermbg=none		 a number constant: 234, 0xff
" hi Boolean ctermfg=6 ctermbg=none	" a boolean constant: TRUE, false
" hi Float ctermfg=6 ctermbg=none		" a floating point constant: 2.3e10

hi! link Identifier Normal
" hi Identifier ctermfg=none ctermbg=none	" any variable name
" hi Function ctermfg=none ctermbg=none	" function name (also: methods for classes)

hi! link Statement Normal
" hi Statement ctermfg=none ctermbg=none	" any statement
" hi Conditional ctermfg=13 ctermbg=none	" if, then, else, endif, switch, etc.
" hi Repeat ctermfg=13 ctermbg=none		" for, do, while, etc.
" hi Label ctermfg=none ctermbg=none		" case, default, etc.
" hi Operator ctermfg=5 ctermbg=none	" "sizeof", "+", "*", etc.
" hi Keyword ctermfg=5 ctermbg=none	" any other keyword
" hi Exception ctermfg=none ctermbg=none	" try, catch, throw

hi! link PreProc Normal
" hi PreProc ctermfg=none ctermbg=none	" generic Preprocessor
" hi Include ctermfg=none ctermbg=none	" preprocessor #include
" hi Define ctermfg=none ctermbg=none		" preprocessor #define
" hi Macro ctermfg=none ctermbg=none		" same as Define
" hi PreCondit ctermfg=none ctermbg=none	" preprocessor #if, #else, #endif, etc.

hi! link Type Normal
" hi Type ctermfg=none ctermbg=none		" int, long, char, etc.
" hi StorageClass ctermfg=none ctermbg=none	" static, register, volatile, etc.
" hi Structure ctermfg=none ctermbg=none	" struct, union, enum, etc.
" hi Typedef ctermfg=none ctermbg=none	" A typedef

hi! link Special Normal
" hi Special ctermfg=none ctermbg=none	" any special symbol
" hi SpecialChar ctermfg=none ctermbg=none	" special character in a constant
" hi Tag ctermfg=none ctermbg=none		" you can use CTRL-] on this
" hi Delimiter ctermfg=none ctermbg=none	" character that needs attention
" hi SpecialComment ctermfg=none ctermbg=none	" special things inside a comment
" hi Debug ctermfg=none ctermbg=none		" debugging statements

" hi Underlined ctermfg=none ctermbg=none	" text that stands out, HTML links
" hi Ignore ctermfg=none ctermbg=none		" left blank, hidden  |hl-Ignore|
" hi Error ctermfg=none ctermbg=none		" any erroneous construct
" hi Todo ctermfg=none ctermbg=none		" anything that needs extra attention; mostly the

" " vim: sw=2
