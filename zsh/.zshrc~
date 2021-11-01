# {{{ Path and Environment variables

export PATH=/sbin:$PATH
export PATH=/bin:$PATH
export PATH=/usr/sbin:/usr/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/go/bin:$PATH

export TERM=xterm-256color
export KEYTIMEOUT=1
export EDITOR=nvim

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=/Applications/Chromium.app/Contents/MacOS/Chromium

# }}}

# {{{ Keybindings

bindkey -v # vi mode

# search history like in emacs mode, fzf will integrate into this
bindkey "^R" history-incremental-search-backward

# Ctrl + N|P to forward / backward in history
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward

export KEYTIMEOUT=1 # quicker timeout between commands

# }}}

# {{{ Options

# automatically cd into dirs
setopt AUTO_CD

# case insensitive glob matching
setopt NO_CASE_GLOB

# Suggestions when misspell
setopt CORRECT
setopt CORRECT_ALL

# }}}

# {{{ Completion

# Customizations should happend before completion is initialized.

# Use case insensitive path completion. Monster cmd!
# Found: https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Partial completion. Eg: '/mn/c/C/do' will complete to '/mnt/c/Code/dotfiles/'
# Found: https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix

zstyle ':completion:*' menu select

# initialize completion
autoload -Uz compinit && compinit

# }}}

# {{{ Autosuggestion

if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
else
	echo 'Warning: zsh-autosuggestions not found in ~/.zsh'
fi

# }}}

# {{{ History

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

# }}}

# {{{ Prompt VI mode

## Init
setopt PROMPT_SUBST

## Options
VI_INS_MODE_SYMBOL=${VI_INS_MODE_SYMBOL:-'INSERT'}
VI_CMD_MODE_SYMBOL=${VI_CMD_MODE_SYMBOL:-'NORMAL'}

## Set symbol for the initial mode
VI_MODE_SYMBOL="${VI_INS_MODE_SYMBOL}"

# on keymap change, define the mode and redraw prompt
zle-keymap-select() {
  if [ "${KEYMAP}" = 'vicmd' ]; then
    VI_MODE_SYMBOL="${VI_CMD_MODE_SYMBOL}"
  else
    VI_MODE_SYMBOL="${VI_INS_MODE_SYMBOL}"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

# reset to default mode at the end of line input reading
zle-line-finish() {
  VI_MODE_SYMBOL="${VI_INS_MODE_SYMBOL}"
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode, you'd be prompted with CMD mode indicator
# while in fact you would be in INS mode.
# Fixed by catching SIGINT (C-c), set mode to INS and repropagate the SIGINT,
# so if anything else depends on it, we will not break it.
TRAPINT() {
  VI_MODE_SYMBOL="${VI_INS_MODE_SYMBOL}"
  return $(( 128 + $1 ))
}

# }}}

# {{{ Prompt GIT status

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

# }}}

# {{{ Prompt general

# General Styling
PROMPT='$VI_MODE_SYMBOL %1~${vcs_info_msg_0_} %# '

# }}}

# {{{ Aliases

# Misc
# Use when installing exuberant-ctags through homebrew
#alias ctags="`brew --prefix`/bin/ctags"
alias reload='source ~/.zshrc'
alias rebuild-completion='rm -f ~/.zcompdump; compinit'

# LS
alias ls='ls -G'
alias ll='ls -al -G'

# Places
alias code='cd ~/Code/'
alias work='cd ~/Code/Work'
alias oss='cd ~/Code/OSS'
alias dotfiles='cd ~/Code/OSS/dotfiles/'

# Git
alias gl='git log --oneline'
alias gs='git status'
alias gd='git diff'
alias gdt='git difftool'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gp='git push'

# }}}

# {{{ FZF

# TODO: check if fzf exists in path before settings these variables
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='--height 100% --color=hl:13,hl+:13,fg+:11,marker:11,border:8,prompt:-1,pointer:11,spinner:-1,bg+:-1,bg:-1,spinner:-1,info:-1,fg:-1'

# if [[ ! "$PATH" == *~/.fzf/bin* ]]; then
#   export PATH="${PATH:+${PATH}:}~/.fzf/bin"
# fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# }}}

# {{{ Node version manager (n)

# n-install (see http://git.io/n-install-repo).
export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# }}}

# {{{ Private

if [ -f ~/.zsh_private ]; then
  source ~/.zsh_private
fi

# }}}

# AUTOGENERATED

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gustaf/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gustaf/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gustaf/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gustaf/google-cloud-sdk/completion.zsh.inc'; fi

alias luamake=/Users/gustaf/.local/lua-language-server/3rd/luamake/luamake
