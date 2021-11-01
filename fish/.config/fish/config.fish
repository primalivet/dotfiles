if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -g fish_key_bindings fish_vi_key_bindings

set -U EDITOR nvim
set -U FZF_DEFAULT_COMMAND 'rg --files --hidden'
set -U FZF_DEFAULT_OPTS '--height 100% --color=hl:13,hl+:13,fg+:11,marker:11,border:8,prompt:-1,pointer:11,spinner:-1,bg+:-1,bg:-1,spinner:-1,info:-1,fg:-1'

fish_add_path $N_PREFIX/bin $PATH
fish_add_path /opt/homebrew/bin $PATH

bind -M insert \cP history-prefix-search-backward
bind -M insert \cN history-prefix-search-forward

alias code="cd ~/Code/"
alias work="cd ~/Code/Work"
alias oss="cd ~/Code/OSS"
alias dotfiles="cd ~/Code/OSS/dotfiles/"
