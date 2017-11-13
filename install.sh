#!/bin/bash
# Thanks to Martin - https://github.com/martin-svk/dot-files/blob/master/install.sh

# Varialbles

replace=false
current_path=$(pwd)

# Overwrite files dialog

echo "Do you want to overwrite old files and folders? [Y/n]"

read answer

if [ $answer = "Y" ]; then
  echo "Roger!"
  replace=true
fi

# Functions

command_exists() {
  type "$1" &>/dev/null
}

link_bash() {
  echo -n "Creating symbolc link for .bashrc..."
  ln -sf $current_path/bash/.bashrc ~/.bashrc
  echo "done!"
}

link_zsh() {
  echo -n "Creating symbolc link for .zshrc..."
  ln -sf $current_path/zsh/.zshrc ~/.zshrc
  echo "done!"
}

link_git() {
  echo -n "Creating symbolc link for .gitconfig..."
  ln -sf $current_path/git/.gitconfig ~/.gitconfig
  echo "done!"
}

link_tmux() {
  echo -n "Creating symbold link for tmux.conf..."
  ln -sf $current_path/tmux/tmux.conf ~/.tmux.conf
  echo "done!"
}

link_vim() {
  echo -n "Creating symbolic link for .vimrc..."
  ln -sf $current_path/nvim/init.vim ~/.vimrc
  echo "done!"
}

link_nvim() {
  echo -n "Creating folders for neovim..."
  mkdir -p ~/.config/nvim
  echo "done!"

  echo -n "Creating symbolic link for init.vim..."
  ln -sf $current_path/nvim/init.vim ~/.config/nvim/init.vim
  echo "done!"
}

link_npm() {
  echo -n "Creating folders for npm..."
  mkdir -p ~/.npm-global
  echo "done!"

  echo -n "Creating symbolic link for .npmrc..."
  ln -sf $current_path/npm/.npmrc ~/.npmrc
  echo "done!"
}

# Bash config

if [ ! -f ~/.bashrc ]; then
  link_bash
elif $replace; then
  echo -n "Removing old zshrc..."
  rm ~/.bashrc
  echo "done!"

  link_bash
else 
  echo "Keeping the old .bashrc"
fi

# ZSH config

if [ ! -f ~/.zshrc ]; then
  link_zsh
elif $replace; then
  echo -n "Removing old .zshrc..."
  rm ~/.zshrc
  echo "done!"

  link_zsh
else 
  echo "Keeping the old .zshrc"
fi

# Git config

if [ ! -f ~/.gitconfig ]; then
  link_git
elif $replace; then
  echo -n "Removing old .gitconfig..."
  rm ~/.gitconfig
  echo "done!"

  link_git
else 
  echo "Keeping the old .gitconfig"
fi

# Tmux config

if [ ! -f ~/tmux.conf ]; then
  link_tmux
elif $replace; then
  echo -n "Removing old tmux.conf..."
  rm ~/tmux.conf
  echo "done!"

  link_tmux
else 
  echo "Keeping the old tmux.conf..."
fi

# Vim config

if [ ! -f ~/.vimrc ]; then
  link_vim
elif $replace; then
  echo -n "Removing old .vimrc..."
  rm ~/.vimrc
  echo "done!"

  link_vim
else 
  echo "Keeping the old .vimrc!"
fi

# Neovim config

if [ ! -d ~/.config/nvim ]; then
  link_nvim
elif $replace; then
  echo -n "Removing old nvim folder..."
  rm -rf ~/.config/nvim
  echo "done!"

  link_nvim
else 
  echo "Keeping the old nvim"
fi

# NPM config

if [ ! -d ~/.npm-global ]; then
  link_npm
elif $replace; then
  echo -n "Removing old npm folder..."
  rm -rf ~/.npm-global
  echo "done!"

  link_npm
else 
  echo "Keeping the old npm"
fi
