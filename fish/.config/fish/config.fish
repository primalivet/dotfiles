if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_term24bit 0

set fish_greeting ""

set -g fish_key_bindings fish_vi_key_bindings

set -U EDITOR nvim
set -U FZF_DEFAULT_COMMAND 'rg --files --hidden'
#set -U FZF_DEFAULT_OPTS '--height 100% --color=hl:13,hl+:13,fg+:11,marker:11,border:8,prompt:-1,pointer:11,spinner:-1,bg+:-1,bg:-1,spinner:-1,info:-1,fg:-1'
set -U FZF_DEFAULT_OPTS '--height 100%'
set -U N_PREFIX $HOME/.n

fish_add_path $N_PREFIX/bin $PATH
fish_add_path /opt/homebrew/bin $PATH

bind -M insert \cP history-prefix-search-backward
bind -M insert \cN history-prefix-search-forward

alias reload="source ~/.config/fish/config.fish"

alias l="ls -al"
alias code="cd ~/Code/"
alias work="cd ~/Code/Work"
alias oss="cd ~/Code/OSS"
alias dotfiles="cd ~/Code/OSS/dotfiles/"

# Set colors to "ansi-like", more at:
# https://github.com/fish-shell/fish-shell/issues/3443
set -U fish_color_autosuggestion      brblack
set -U fish_color_cancel              -r
set -U fish_color_command             brgreen
set -U fish_color_comment             brmagenta
set -U fish_color_cwd                 green
set -U fish_color_cwd_root            red
set -U fish_color_end                 brmagenta
set -U fish_color_error               brred
set -U fish_color_escape              brcyan
set -U fish_color_history_current     --bold
set -U fish_color_host                normal
set -U fish_color_match               --background=brblue
set -U fish_color_normal              normal
set -U fish_color_operator            cyan
set -U fish_color_param               brblue
set -U fish_color_quote               yellow
set -U fish_color_redirection         bryellow
set -U fish_color_search_match        'bryellow' '--background=brblack'
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_user                brgreen
set -U fish_color_valid_path          --underline
set -U fish_pager_color_completion    normal
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'
