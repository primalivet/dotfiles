################################################################################
# EXPORT
################################################################################

export LANG='en_US.UTF-8'
export LC_TIME='sv_SE.UTF-8'
export TERM=screen-256color
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export KEYTIMEOUT=1 # Reduce key timeout to increase vi bindings responsiveness

if type nvim &> /dev/null; 
then export EDITOR=nvim
else export EDITOR=vim
fi
export VISUAL=$EDITOR

################################################################################
# PATH
################################################################################

export PATH="/opt/homebrew/bin:$PATH"

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

if [ -x "$(command -v kubectl)" ]; then
  source <(kubectl completion zsh)
fi

################################################################################
# SUPPORT
################################################################################

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

################################################################################
# ALIASES
################################################################################

alias vi='nvim'
alias reload='. ~/.zshrc'
alias ..='cd ..'
alias ~="cd $HOME"

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
