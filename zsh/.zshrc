################################################################################
# EXPORT
################################################################################

export LANG='en_US.UTF-8'
export LC_TIME='sv_SE.UTF-8'
export TERM=screen-256color
export BREW_PREFIX="/opt/homebrew"
export N_PREFIX=$HOME/.local/src/n
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export LOCAL_SRC=$HOME/.local/src
export LOCAL_BIN=$HOME/.local/bin
export KEYTIMEOUT=1 # Reduce key timeout to increase vi bindings responsiveness

if type nvim &> /dev/null; 
then export EDITOR=nvim
else export EDITOR=vim
fi
export VISUAL=$EDITOR

################################################################################
# PATH
################################################################################

export PATH=$BREW_PREFIX/bin/:$PATH
export PATH=$HOME/.docker/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$LOCAL_BIN:$PATH
export PATH=$LOCAL_SRC/neovim/bin:$PATH
export PATH=$N_PREFIX/bin:$PATH
export PATH=$PATH:/Applications/Zed.app/Contents/MacOS

################################################################################
# ZSH VARIABLES https://zsh.sourceforge.io/Doc/Release/Parameters.html
################################################################################

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

################################################################################
# ZSH OPTIONS https://zsh.sourceforge.io/Doc/Release/Options.html
################################################################################

# HISTORY
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

################################################################################
# ZSH COMPLETION
################################################################################

# Add completions installed through Homebrew packages
# See: https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH="$BREW_PREFIX/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# COMPLETION (the hyphen makes the "." command follow symlinks)
[[ -d $HOME/zsh.d ]] && source $HOME/zsh.d/completion_*(-.)


# Speed up completion (https://gist.github.com/ctechols/ca1035271ad134841284)
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt auto_pushd

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive path-completion
zstyle ':completion:*' menu select # Allow to select in completion menu

################################################################################
# KEY BINDINGS
################################################################################

bindkey -v # Use vi keybindings

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

bindkey '^[[Z' reverse-menu-complete # Reverse through completion with Shift-Tab
bindkey '^?' backward-delete-char # Backspace as expected in Emacs

# Open line in Vim by pressing 'v' in Command-Mode
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# bindkey -v # Use vi keybindings
#
# bindkey '^R' history-incremental-search-backward
# bindkey '^S' history-incremental-search-forward
#
# bindkey '^P' history-search-backward
# bindkey '^N' history-search-forward
#
# bindkey '^Y' accept-search
#
#
# if [ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
#   bindkey '^y' autosuggest-accept
# fi


################################################################################
# SUPPORT
################################################################################

# AUTOSUGGESTION
# [[ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
#   source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# FZF
if type fzf &> /dev/null; then
  if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
  fi
  export FZF_DEFAULT_OPTS="--height=100% --reverse --color=bw"
  eval "$(fzf --zsh)"
fi

# DIRENV
eval "$(direnv hook zsh)"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# DENO
[ -f "$HOME/.deno/env" ] && source $HOME/.deno/env
[ -f "$HOME/.local/share/bash-completion/completions/deno.zsh" ] && \
	source $HOME/.local/share/bash-completion/completions/deno.zsh

################################################################################
# ALIASES
################################################################################

alias vi='nvim'
alias reload='. ~/.zshrc'
alias ls='ls --color'
alias ll='ls -al'
alias ..='cd ..'
alias ~="cd $HOME"
alias ta='tmux attach'
alias tl='tmux ls'

################################################################################
# PROMPT
################################################################################

[ -f ~/zsh.d/prompt.zsh ] && source ~/zsh.d/prompt.zsh

################################################################################
# FUNCTIONS
################################################################################

[ -f ~/zsh.d/functions.zsh ] && source ~/zsh.d/functions.zsh

################################################################################
# PRIVATE
################################################################################

[ -f ~/.zsh_private ] && source ~/.zsh_private
