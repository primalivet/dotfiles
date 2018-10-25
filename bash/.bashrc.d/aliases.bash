if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias grep='grep --color=auto'
fi

# view all files exept (. and ..) in list format with human readable sizes and
# group directories first
alias ld='ls -Alh --group-directories-first'

# use neovim in place of vi and vim if available
if command_exists nvim; then
    alias vi='nvim'
    alias vim='nvim'
fi
