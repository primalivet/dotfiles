set -x LANG en_US.UTF-8
set -x LC_TIME sv_SE.UTF-8
set -x TERM screen-256color
set -x LOCAL_SRC $HOME/.local/src
set -x LOCAL_BIN $HOME/.local/bin
set -x BREW_PREFIX /opt/homebrew
set -x N_PREFIX $HOME/.local/src/n
set -x RIPGREP_CONFIG_PATH ~/.ripgreprc
set -x EDITOR (command -v nvim >/dev/null; and echo nvim; or echo vim)
set -x VISUAL $EDITOR

set -U fish_greeting

fish_add_path $LOCAL_BIN
fish_add_path $LOCAL_SRC/neovim/bin
fish_add_path $BREW_PREFIX/bin
fish_add_path $HOME/.docker/bin
fish_add_path $HOME/go/bin
fish_add_path $N_PREFIX/bin
fish_add_path /Applications/Zed.app/Contents/MacOS

alias vi='nvim'
alias reload='source ~/.config/fish/config.fish'
alias ta='tmux attach'
alias tl='tmux ls'

if status is-interactive
end

if test -f $HOME/.local/share/fish/private.fish
    source $HOME/.local/share/fish/private.fish
end

command -v direnv >/dev/null; and direnv hook fish | source

# FZF Integration
# if command -v fzf >/dev/null
#     if command -v rg >/dev/null
#         set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git"'
#     end
#     set -x FZF_DEFAULT_OPTS "--height=100% --reverse --color=bw"
# end


# Pyenv
# set -x PYENV_ROOT $HOME/.pyenv
# if test -d $PYENV_ROOT/bin
#     fish_add_path $PYENV_ROOT/bin
# end
# pyenv init - | source

# Deno
# if test -f "$HOME/.deno/env"
#     source $HOME/.deno/env
# end
