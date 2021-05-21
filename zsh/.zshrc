# PATH
#-------------------------------------------------------------------------------

export PATH=/sbin:$PATH
export PATH=/bin:$PATH
export PATH=/usr/sbin:/usr/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# DIRCOLORS
#-------------------------------------------------------------------------------

# check for dircolors support and load .dircolors if it exists
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# GENERAL SHELL OPTIONS
#-------------------------------------------------------------------------------

# automatically cd into dirs
setopt AUTO_CD

# case insensitive glob matching
setopt NO_CASE_GLOB

# Suggestions when misspell
setopt CORRECT
setopt CORRECT_ALL

# GENERAL ENV VARIABLES
#-------------------------------------------------------------------------------

export KEYTIMEOUT=1

EDITOR=nvim

# KEYBINDINGS
#-------------------------------------------------------------------------------

# use vim keybindings
bindkey -e

# COMPLETION
#-------------------------------------------------------------------------------

# Customizations should happend before completion is initialized.

# Use case insensitive path completion. Monster cmd!
# Found: https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Partial completion. Eg: '/mn/c/C/do' will complete to '/mnt/c/Code/dotfiles/'
# Found: https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix

# initialize completion
autoload -Uz compinit && compinit

# AUTOSUGGESTIONS
#-------------------------------------------------------------------------------

if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
else
	echo 'Warning: zsh-autosuggestions not found in ~/.zsh'
fi

# HISTORY
#-------------------------------------------------------------------------------

# History in zdotdir if exsits, otherwise home dir
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

SAVEHIST=10000
HISTSIZE=10000

# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY

# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# do not store duplications
setopt HIST_IGNORE_DUPS

# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# PROMPT
#-------------------------------------------------------------------------------

# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Visual-effects
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information

# Git Integation - https://salferrarello.com/zsh-git-status-prompt/
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt PROMPT_SUBST
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr '%F{red}*%f'
zstyle ':vcs_info:*' stagedstr '%F{yellow}+%f'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       ' %b%u%c'
zstyle ':vcs_info:git:*' actionformats ' %b|%a%u%c'

# General expantions in prompt
# %m = host
# %# = prompt sign % in normal # in super (like sudo)
# %/ = full path
# %~ = shorter path
# %2~ = max 2 dirs
# %f = reset color
# %F{0} = foreground color ANSI 0-255
# %B = bold
# %b = unbold

# General Styling
PROMPT='%1~${vcs_info_msg_0_} %# '

# ALIASES
#-------------------------------------------------------------------------------

alias reload='source ~/.zshrc'
alias rebuild-completion='rm -f ~/.zcompdump; compinit'

alias ls='ls --color'
alias ll='ls -al --color'
alias code='cd /mnt/c/Code/'
alias dotfiles='cd /mnt/c/Code/dotfiles/'

alias vi='nvim'

alias gl='git log --oneline'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gp='git push'

# FZF
#-------------------------------------------------------------------------------

# Setup fzf
if [[ ! "$PATH" == *~/.fzf/bin* ]]; then
  export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ag/.ignore --hidden -g ""'
  export FZF_DEFAULT_OPTS='--height 100% --color=hl:13,hl+:13,fg+:11,marker:11,border:8,prompt:-1,pointer:11,spinner:-1,bg+:-1,bg:-1,spinner:-1,info:-1,fg:-1'

  export PATH="${PATH:+${PATH}:}~/.fzf/bin"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NODE VERSION MANANGER (N)
#-------------------------------------------------------------------------------


# NODE VERSION MANAGER (NVM)
#-------------------------------------------------------------------------------

# set node version manager enviroment variable
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# YARN VERSION MANAGER (YVM)
#-------------------------------------------------------------------------------

export YVM_DIR=/home/primalivet/.yvm
[ -r $YVM_DIR/yvm.sh ] && source $YVM_DIR/yvm.sh

# PRIVATE
#-------------------------------------------------------------------------------

if [ -f ~/.zsh_private ]; then
  source ~/.zsh_private
fi
