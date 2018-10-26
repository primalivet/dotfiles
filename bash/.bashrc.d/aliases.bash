# using function instead of aliases as it let's us process arguments sent to a
# command, somthing that's impossible with aliases. You can read more about
# this in Tom Ryders post https://sanctum.geek.nz/arabesque/custom-commands/

# ls on steriods
# -A : all files, including .dotfiles. but don't include . and ..
# -l : list/long format
# -h : sizes in human readable format
# --colors=auto : colors from LS_COLORS enviroment variable
ll() {
    if [ -x /usr/bin/dircolors ]; then
        command ls -Alh --color=auto "$@"
    else
        command ls -Alh "$@"
    fi
}

# use neovim in place of vi and vim if available
if command_exists nvim; then
    alias vi='nvim'
    alias vim='nvim'
fi
