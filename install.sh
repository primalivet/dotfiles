#!/bin/bash
# Thanks to Martin - https://github.com/martin-svk/dot-files/blob/master/install.sh

# Varialbles

replace=false
current_path=$(pwd)

# Overwrite files dialog

echo "Do you want to overwrite old files and folders? [Y/n]"

read answer

if [ $answer = "Y" ]; then
  echo "Okay, overwriting old files and folders with the new dotfiles."
  replace=true
fi

# Functions

command_exists() {
  type "$1" &>/dev/null
}

# ZSH config

if [ ! -f ~/.zshrc ]; then
  echo "Creating .zshrc!"
elif $replace; then
  echo "Removing old .zshrc!"
else 
  echo "Keeping the old .zshrc"
fi

# Neovim config

if [ ! -d ~/.config/nvim ]; then
  echo "Creating nvim folder!"
elif $replace; then
  echo "Removing old nvim folder"
  rm -rf ~/.config/nvim
  echo "Creating new nvim folder"
  mkdir -p ~/.config/nvim
  ln -sf $current_path/nvim/init.vim ~/.config/nvim/nvim.init
else 
  echo "Keeping the old nvim folder then"
fi

# Vim config

if [ ! -f ~/.vimrc ]; then
  echo "Creating symbolic link for .vimrc!"
elif $replace; then
  echo "Removing old .vimrc!"
else 
  echo "Keeping the old .vimrc!"
fi
