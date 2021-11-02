if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -g fish_key_bindings fish_vi_key_bindings

set -U EDITOR nvim
set -U FZF_DEFAULT_COMMAND 'rg --files --hidden'
set -Ux FZF_DEFAULT_OPTS "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
#set -U FZF_DEFAULT_OPTS '--height 100% --color=hl:13,hl+:13,fg+:11,marker:11,border:8,prompt:-1,pointer:11,spinner:-1,bg+:-1,bg:-1,spinner:-1,info:-1,fg:-1'
set -U N_PREFIX $HOME/.n

fish_add_path $N_PREFIX/bin $PATH
fish_add_path /opt/homebrew/bin $PATH

bind -M insert \cP history-prefix-search-backward
bind -M insert \cN history-prefix-search-forward

alias reload="source ~/.config/fish/config.fish"
if type -q exa
        alias ll "exa -l -g --icons"

else
        alias l="ls -al"
end
alias code="cd ~/Code/"
alias work="cd ~/Code/Work"
alias oss="cd ~/Code/OSS"
alias dotfiles="cd ~/Code/OSS/dotfiles/"
