# PATH
#-------------------------------------------------------------------------------

export PATH=/home/primalivet/.local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/sbin:/usr/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/bin:$PATH

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

# EDITOR
#-------------------------------------------------------------------------------

EDITOR=nvim

# HISTORY
#-------------------------------------------------------------------------------


# PROMPT
#-------------------------------------------------------------------------------
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Visual-effects
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information

# Git Integation - https://salferrarello.com/zsh-git-status-prompt/
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
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

alias ll='ls -al'

alias vi='nvim'

alias gl='git log --oneline'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gp='git push'

