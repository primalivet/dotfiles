" check if vim-plug is installed
"if !filereadable('~/.vim/autoload/plug.vim')
"  if executable('curl')
"    call system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
"    if v:shell_error
"      echom "Error installing vim-plug to ~/.vim/autoload, Please try installing it manually.\n"
"      exit
"    endif
"  else
"      echom "vim-plug not installed. Please install it manually or install curl.\n"
"      exit
"  endif
"endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'gerw/vim-HiLinkTrace'
Plug 'primalivet/vim-realrealplain'
Plug 'primalivet/vim-friendly'
Plug 'chrisbra/Colorizer'

call plug#end()
