# ENVIRONMENT VARIABLES
#------------------------------------------------------------------------------
export TERM=xterm-256color
export LOCAL_BIN=$HOME/.local/bin
export LOCAL_SRC=$HOME/.local/src

# History
export HISTFILE=~/.histfile
export HISTSIZE=1000000
export SAVEHIST=1000000

# Editor
export VISUAL=nvim
export EDITOR=nvim
export GIT_EDITOR=nvim

# More speed (especially when going in and out of insert mode (vi))
export KEYTIMEOUT=1

# Node version manager install directory
export N_PREFIX=$HOME/.local/src/n

# Wasmtime (wasm runtime)
export WASMTIME_HOME="$HOME/.wasmtime"

# Path
export PATH=$LOCAL_BIN:$PATH
export PATH=$N_PREFIX/bin:$PATH
export PATH="$LOCAL_SRC/lua-language-server/bin":$PATH
export PATH="$WASMTIME_HOME/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Homebrew paths (only on mac / Darwin) systems
[[ $(eval uname) = "Darwin" ]] && export PATH="/opt/homebrew/bin/:$PATH"
[[ $(eval uname) = "Darwin" ]] && export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# Fzf (fuzzy file search)
FZF_COLORS="bg+:-1,\
fg:-1,\
fg+:-1,\
border:-1,\
spinner:-1,\
hl:4,\
header:-1,\
info:-1,\
pointer:-1,\
marker:-1,\
prompt:-1,\
hl+:4"

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git" --glob "!.stack-work"'
export FZF_DEFAULT_OPTS="--height=100% --reverse --color=$FZF_COLORS"

# OPTIONS
#------------------------------------------------------------------------------

# History
# do not put duplicated command into history list
setopt HIST_IGNORE_ALL_DUPS
# do not save duplicated command
setopt HIST_SAVE_NO_DUPS
# remove unnecessary blanks
setopt HIST_REDUCE_BLANKS
# append command to history file immediately after execution
setopt INC_APPEND_HISTORY_TIME
# record command start time
setopt EXTENDED_HISTORY

# auto cd into directories
setopt AUTO_CD

# Allow to select in completion menu
zstyle ':completion:*' menu select

# Keybindings
#------------------------------------------------------------------------------

# Use vi keybindings
bindkey -v

# Reverse through completion with Shift-Tab
bindkey '^[[Z' reverse-menu-complete

# Use C-p and C-n to traverse history
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Backspace as expected in Emacs
bindkey "^?" backward-delete-char

# "PLUGINS"
#------------------------------------------------------------------------------

# Autosuggestions
[[ -f "$LOCAL_SRC/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
  source "$LOCAL_SRC/zsh-autosuggestions/zsh-autosuggestions.zsh"
# Completion
[[ -d "$LOCAL_SRC/zsh-completions/src" ]] && \
  fpath=("$LOCAL_SRC/zsh-completions/src" $fpath)
# # Sytax highlight
[[ -f "$LOCAL_SRC/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
  source "$LOCAL_SRC/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# PROGRAMS
#------------------------------------------------------------------------------

# DotNet
# [[ -d "$HOME/.dotnet" ]] && export DOTNET_ROOT="$HOME/.dotnet"

# Ocaml
[[ ! -r /Users/gustaf/.opam/opam-init/init.zsh ]] || source /Users/gustaf/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Rust (cargo env script also add Rust bins to PATH)
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Haskell (GHCup)
[[ -f "$HOME/.ghcup/env" ]] && source "$HOME/.ghcup/env"

# Z "junp around"
[[ -f "$LOCAL_SRC/z/z.sh" ]] && source "$LOCAL_SRC/z/z.sh"

# Fzf man pages, key bindings and completion
[[ -d "$LOCAL_SRC/fzf/man" ]] && \
  export MANPATH=$LOCAL_SRC/fzf/man:$MANPATH
[[ -f "$LOCAL_SRC/fzf/shell/key-bindings.zsh" ]] && \
  source "$LOCAL_SRC/fzf/shell/key-bindings.zsh"
[[ -f "$LOCAL_SRC/fzf/shell/completion.zsh" ]] && \
  source "$LOCAL_SRC/fzf/shell/completion.zsh"

# ALIASES
#------------------------------------------------------------------------------

alias vil='nvim -c "set background=light"'
alias v='nvim --clean -u ~/.vim/vimrc'
alias vi='nvim'
alias reload='. ~/.zshrc'
alias ls='ls --color=auto'
alias l='ls -al'
alias ll='ls -al'
alias ..='cd ..'
alias ~="cd $HOME"
alias ta='tmux attach'
alias tl='tmux ls'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias glo='git log --oneline'
alias glog='git log --oneline --graph'
alias gc='git commit'
alias ga='git add'

# PROMPT
#------------------------------------------------------------------------------

# autoload -Uz vcs_info # enable vcs info
# precmd () { vcs_info }  # make sure vcs info is loaded before displaying prompt
# zstyle ':vcs_info:*' formats ' %b' # format branch name
# setopt prompt_subst
# export PROMPT='%1~${vcs_info_msg_0_} $ '

export PROMPT='%1~ $ '

# Vi mode cursor
#------------------------------------------------------------------------------
# Borrowed from: https://thevaluable.dev/zsh-install-configure-mouseless/
# See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes

cursor_mode() {
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# PRIVATE
#------------------------------------------------------------------------------

[ -f ~/.zsh_private ] && source ~/.zsh_private

# LOAD COMPLETION
#------------------------------------------------------------------------------
# What does it mean?

# The autoload command load a file containing shell commands. To find this file,
# Zsh will look in the directories of the Zsh file search path, defined in the
# variable $fpath, and search a file called compinit.

# When compinit is found, its content will be loaded as a function. The function
# name will be the name of the file. You can then call this function like any
# other shell function.
autoload -U compinit; compinit

# opam configuration
[[ ! -r /Users/gustaf/.opam/opam-init/init.zsh ]] || source /Users/gustaf/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# COMPLETION
#------------------------------------------------------------------------------

# zsh parameter completion for the dotnet CLI

_dotnet_zsh_complete() {
  local completions=("$(dotnet complete "$words")")
  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi
  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet

