# using function instead of aliases as it let's us process arguments sent to a
# command, somthing that's impossible with aliases. You can read more about
# this in Tom Ryders post https://sanctum.geek.nz/arabesque/custom-commands/

# ll - more detailed listing
# -A : all files, including .dotfiles. but don't include . and ..
# -l : list/long format
# -h : sizes in human readable format
# --colors=auto : colors from LS_COLORS enviroment variable
ll() {
    if [ -x /usr/bin/dircolors ]; then
        command ls -Alh "$@"
    else
        command ls -Alh "$@"
    fi
}

# lld - more detailed and directory grouped listing build on top of the
# "ll" command
# --group-directories-first does what it sounds like
lld() {
    ll "--group-directories-first" "$@"
}

# prioritize nvim over vim and vim over vi
vi() {
    if command_exists nvim; then
        command nvim "$@"
    elif command_exists vim; then
        command vim "$@"
    else
        command vi "$@"
    fi
}

vim() {
    vi "$@"
}
