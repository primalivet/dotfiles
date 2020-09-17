#!/bin/sh

#  -e exit immediatley if a simple command  exits with non-zero
#  -u treat unset variables as errors in parameter expressions
#  -C prevent output redirection
set -euC

attach() {
    [ -n "${TMUX:-}" ] &&
        tmux switch-client -t  '=dotfiles' ||
        tmux attach-session -t '=dotfiles'
}

if tmux has-session -t '=dotfiles' 2> /dev/null; then
    attach
    exit 0
fi

# -d prevent tmux to attach the new session
# -s session name
# -n window name (a new tmux session always need atleast 1 window)
tmux new-session -d -s dotfiles
tmux send-keys -t '=dotfiles:1' 'git log --oneline | head' Enter
