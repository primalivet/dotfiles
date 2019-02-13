# if not interactive, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# helper function to check if command exists
command_exists() {
    type "$1" &> /dev/null
}

# ignore duplicate input
HISTCONTROL=ignoredups 

# correct small errors when using cd
shopt -s cdspell
# check the window size after each command and update if changed
shopt -s checkwinsize 
# correct small errors when completing
shopt -s dirspell
# append to the history file
shopt -s histappend 
# dont complete tab press on empty line with every single option
shopt -s no_empty_cmd_completion

# update path with home/bin
export PATH=$HOME/.local/bin:$PATH 
# xdg path config directory
export XDG_CONFIG_HOME=$HOME/.config
# set TERM to use 256 colors
export TERM=xterm-256color 
# set node version manager directory
export NVM_DIR="$HOME/.nvm"
# set EDITOR to nvim if it exists
if command_exists nvim; then export EDITOR=nvim; fi

# check for dircolors support and load .dircolors if it exists
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# load bash startup scripts
for script in "$HOME"/.bashrc.d/*.bash ; do
    [[ -e $script ]] || continue
    source $script
done
unset -v script

# enable programmable completion features 
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
