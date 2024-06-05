# ENVIRONMENT VARIABLES
#------------------------------------------------------------------------------

export TERM=xterm-256color

# Local (src/bin)
export LOCAL_SRC=$HOME/.local/src
export LOCAL_BIN=$HOME/.local/bin
export PATH=$LOCAL_BIN:$PATH

# Homebrew
export BREW_PREFIX="/opt/homebrew"
export PATH=$BREW_PREFIX/bin/:$PATH

# Not vim
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Applications/Zed.app/Contents/MacOS"

# GO
export PATH="$HOME/go/bin:$PATH"

# Rust
[[ -f "$HOME/.cargo" ]] && source "$HOME/.cargo/env"

# N (node version manager)
export N_PREFIX=$HOME/.local/src/n
export PATH=$N_PREFIX/bin:$PATH

export RIPGREP_CONFIG_PATH=~/.ripgreprc

# More speed (especially when going in and out of insert mode (vi))
export KEYTIMEOUT=1

if type nvim &> /dev/null; then
  export VISUAL=nvim
  export EDITOR=nvim
  export GIT_EDITOR=nvim
else
  export VISUAL=vim
  export EDITOR=vim
  export GIT_EDITOR=vim
fi

if type fzf &> /dev/null && type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git" --glob'
  export FZF_DEFAULT_OPTS="--height=100% --reverse --color=bw"
fi

[[ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
  source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || \
  source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# direnv
eval "$(direnv hook zsh)"

# History
#------------------------------------------------------------------------------

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt INC_APPEND_HISTORY_TIME # Immediately append after execution
setopt EXTENDED_HISTORY # Timestamps in history
setopt HIST_EXPIRE_DUPS_FIRST # Duplicates goes first when trimming
setopt HIST_IGNORE_DUPS # Dont record entry which was just recorded
setopt HIST_IGNORE_ALL_DUPS # Don't put duplicated command into history list
setopt HIST_SAVE_NO_DUPS # Don't save duplicated command
setopt HIST_REDUCE_BLANKS # Remove unnecessary blanks
setopt HIST_IGNORE_SPACE # Don't save entry if staring with space
setopt SHARE_HISTORY # Share history between sessions
unsetopt HIST_VERIFY # Execute commands using history (e.g.: using !$) immediately

# Completion
#------------------------------------------------------------------------------

# Add completions installed through Homebrew packages
# See: https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH="$BREW_PREFIX/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# # Speed up completion (https://gist.github.com/ctechols/ca1035271ad134841284)
# autoload -Uz compinit
# for dump in ~/.zcompdump(N.mh+24); do
#   compinit
# done

unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt auto_pushd

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive path-completion
zstyle ':completion:*' menu select # Allow to select in completion menu

# azure specific completions
# source '/opt/homebrew/etc/bash_completion.d/az'

# Key bindings
#------------------------------------------------------------------------------

bindkey '^[[Z' reverse-menu-complete # Reverse through completion with Shift-Tab
bindkey -v # Use vi keybindings

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

bindkey '^Y' accept-search

bindkey '^?' backward-delete-char # Backspace as expected in Emacs

if type brew &>/dev/null && type fzf &> /dev/null; then
  eval "$(fzf --zsh)" # Overwrites any existing bindings that conflicts, eg. CTRL_R
fi

# FUNCTIONS
#------------------------------------------------------------------------------

[ -f ~/zsh.d/functions.zsh ] && source ~/zsh.d/functions.zsh

# ALIASES
#------------------------------------------------------------------------------

alias vi='nvim'
alias reload='. ~/.zshrc'
alias ls='ls --color=auto'
alias ll='ls -al'
alias ..='cd ..'
alias ~="cd $HOME"
alias ta='tmux attach'
alias tl='tmux ls'
alias tn=fuzzy_start_tmux_session
alias c=fuzzy_charge_project
alias docker=podman


# PROMPT
#------------------------------------------------------------------------------

[ -f ~/zsh.d/prompt.zsh ] && source ~/zsh.d/prompt.zsh

# PRIVATE
#------------------------------------------------------------------------------

[ -f ~/.zsh_private ] && source ~/.zsh_private
