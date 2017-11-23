" check if vim-plug is installed
if !filereadable('~/.vim/autoload/plug.vim')
  if executable('curl')
    call system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    if v:shell_error
      echom "Error installing vim-plug to ~/.vim/autoload, Please try installing it manually.\n"
      exit
    endif
  else
    echom "vim-plug not installed. Please install it manually or install curl.\n"
    exit
  endif
endif

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'

call plug#end()
