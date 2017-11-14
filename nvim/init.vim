"Thank you Doug Black for a good start
"https://dougblack.io/words/a-good-vimrc.html

set nocompatible		            "disable vi compatibility

colorscheme default             "set colorscheme

set autoindent                  "keep the same indentation as the previous line
set autoread                    "update files if they're changed outside vim
set backspace=indent,eol,start  "make backspace behave like normal
set softtabstop=2 	            "a TAB is 2 spaces also when editing
set tabstop=2				            "a TAB is 2 spaces when viewing
set shiftwidth=2                "keep consistent spacing
set expandtab				            "a TAB is acually spaces
set smartindent 
set number					            "enable line numbers
set relativenumber	            "enable relative numbers
set showcmd					            "show commands in the bottom bar
set cursorline			            "enable current line highlighting
set lazyredraw			            "only redraw when needed
set wildmenu                    "enable completion
set wildmode=list:longest       "complete like a shell
set showmatch                   "highlight matching [{()}]
set splitright                  "default split to the right 
set splitbelow                  "default split nested down
set laststatus=2                "always show statusline
set scrolloff=10                "when does window start to scroll, in rows
set updatetime=250              "interval for when vim writes swap file to disk
set timeoutlen=1000             "timeout for mappings
set ttimeoutlen=0               "timeout for key codes
set incsearch                   "search as characheters are entered
set hlsearch                    "highlight search matches

"dispable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
