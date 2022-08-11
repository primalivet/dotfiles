# ENVIRONMENT VARIABLES
#------------------------------------------------------------------------------

export TERM=xterm-256color
export LANG="en-US.UTF-8"
export LOCAL_BIN=$HOME/.local/bin
export LOCAL_SRC=$HOME/.local/src

# History
export HISTFILE=~/.histfile
export HISTSIZE=1000000
export SAVEHIST=1000000

# Open man pages in nvim
export MANPAGER="nvim +Man!"

# Editor
export VISUAL=nvim
export EDITOR=nvim
export GIT_EDITOR=nvim

# Rust
export RUST_ROOT=$HOME/.cargo/env

# Node version manager install directory
export N_PREFIX=$HOME/.local/src/n

#Path
export PATH=$LOCAL_BIN:$PATH
export PATH=$RUST_ROOT:$PATH
export PATH=$N_PREFIX/bin:$PATH

[[ $(eval uname) = "Darwin" ]] && export BREW_PATH=/opt/homebrew/bin
[[ $(eval uname) = "Darwin" ]] && export PATH=$BREW_PATH:$PATH

# Fzf (fuzzy file search)
FZF_COLORS="bg+:-1,\
fg:white,\
fg+:yellow,\
border:-1,\
spinner:white,\
hl:yellow,\
header:white,\
info:white,\
pointer:yellow,\
marker:yellow,\
prompt:white,\
hl+:yellow"

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS="--height=100% --color=$FZF_COLORS"


# OPTIONS
#------------------------------------------------------------------------------

# Make sure completion is on
autoload -U compinit; compinit
# Allow to select in completion menu
zstyle ':completion:*' menu select


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

# "PLUGINS"
#------------------------------------------------------------------------------

# Autosuggestions
[[ -f "$LOCAL_SRC/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
  source "$LOCAL_SRC/zsh-autosuggestions/zsh-autosuggestions.zsh"
# Completion
[[ -d "$LOCAL_SRC/zsh-completions/src" ]] && \
  fpath=("$LOCAL_SRC/zsh-completions/src" $fpath)
# Sytax highlight
[[ -f "$LOCAL_SRC/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
  source "$LOCAL_SRC/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# PROGRAMS
#------------------------------------------------------------------------------

# Z "junp around"
[[ -f "$LOCAL_SRC/z/z.sh" ]] && source "$LOCAL_SRC/z/z.sh"

# Add fzf man pages
[[ -d "$LOCAL_SRC/fzf/man" ]] && \
  export MANPATH=$LOCAL_SRC/fzf/man:$MANPATH
# Fzf key bindings
[[ -f "$LOCAL_SRC/fzf/shell/key-bindings.zsh" ]] && \
  source "$LOCAL_SRC/fzf/shell/key-bindings.zsh"
# Fzf completion
[[ -f "$LOCAL_SRC/fzf/shell/completion.zsh" ]] && \
  source "$LOCAL_SRC/fzf/shell/completion.zsh"

# ALIASES
#------------------------------------------------------------------------------

alias vil='vim -c "set background=light"'
alias vi='nvim'
alias vim='nvim'
alias reload='. ~/.zshrc'
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
alias gc='git commit'
alias ga='git add'

# PROMPT
#------------------------------------------------------------------------------

autoload -Uz vcs_info # enable vcs info
precmd () { vcs_info }  # make sure vcs info is loaded before displaying prompt
zstyle ':vcs_info:*' formats ' %b' # format branch name
setopt prompt_subst
export PROMPT='%1~${vcs_info_msg_0_} $ '


# PRIVATE
#------------------------------------------------------------------------------

[ -f ~/.zsh_private ] && source ~/.zsh_private
