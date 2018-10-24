# if not interactive, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# helper function to check if command exists
command_exists() {
    type "$1" &> /dev/null
}

HISTCONTROL=ignoredups # ignore duplicate input

shopt -s histappend # append to the history file
shopt -s checkwinsize # check the window size after each command and update if changed

# update path with home/bin
export PATH=$HOME/.local/bin:$PATH 

# add go lang to path
export PATH=/usr/local/go/bin:$PATH 

# add ~./.npm-global to path
export PATH=$HOME/.npm-global-packages:$PATH 

# set TERM to use 256 colors
export TERM=xterm-256color 

# check for installed editors
if command_exists nvim; then
    export EDITOR=nvim
elif command_exists vim; then
    export EDITOR=vim
else
    export EDITOR=vi
fi

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
