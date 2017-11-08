#!/bin/bash
# Thanks to Martin - https://github.com/martin-svk/dot-files/blob/master/install.sh

# Varialbles

overwrite=false
current_path=$(pwd)

# Overwrite files dialog

echo "Do you want to overwrite old .dotfiles and folders? [Y/n]"

read answer

if [ $answer = "Y" ]; then
  echo "Files and folders will be overwitten"
  overwrite=true
fi

# Functions

command_exists() {
  type "$1" &>/dev/null
}

# ZSH config

if [ ! -f ~/.zshrc ]; then
  echo "Creating .zshrc!"
elif $overwrite; then
  echo "Removing old .zshrc!"
else 
  echo "Keeping the old .zshrc"
fi

# Neovim config

if [ ! -d ~/.config/nvim ]; then
  echo "Creating nvim folder!"
elif $overwrite; then
  echo "Removing old nvim folder"
else 
  echo "Keeping the old nvim folder then"
fi

# Vim config

if [ ! -f ~/.vimrc ]; then
  echo "Creating symbolic link for .vimrc!"
elif $overwrite; then
  echo "Removing old .vimrc!"
else 
  echo "Keeping the old .vimrc!"
fi
