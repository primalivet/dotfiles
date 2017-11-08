#! /bin/bash

# Install script for dotfiles
# ---
# This script creates symlinks in the home directory
# that points to their respective file inside this
# (dotfiles) directory

DATE=`date +%Y%m%d%H%M`
dotfiles_dir=~/dotfiles
backup_dir=~/dotfiles-backup-${DATE}
npm_global_dir=~/.npm-global-test

echo "Creating backup directory: ${backup_dir}"
echo ""
# create backup directory and parents if not yet exist
mkdir -p "$backup_dir" 

# create a .npm-global directory in the ~ folder if it doest
# not yet exist
if [ ! -d $npm_global_dir ];then
  echo "Creating NPM global directory: ${npm_global_dir}"
  echo ""
  mkdir -p "$npm_global_dir"
else
  echo "NPM global directory already exists: ${npm_global_dir}"
  echo ""
fi

for file in "$dotfiles_dir"/.[^.]*; do
  # save dotfile extention/name, the text after the "."
  filename=.${file##*.}

  # full path to the old dotfile
  old_file=${HOME}/${filename}

  # if an old version of the current dotfile exists
  # move it to the backup directory
  if [ -f $old_file ]; then
    # save old dotfile extention/name
    old_filename=.${old_file##*.}
    echo "Found old version of ${old_filename} moving it to backup directory"
    # move the old file into backup directory
    mv $old_file $backup_dir
  fi

  echo "Creating symbolic link in ${HOME} to ${file}"
  ln -s $file $HOME/$filename 
  echo ""
done
