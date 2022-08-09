# Prompt

autoload -Uz vcs_info # enable vcs info
precmd () { vcs_info }  # make sure vcs info is loaded before displaying prompt
zstyle ':vcs_info:*' formats ' %b' # format branch name
setopt prompt_subst
export PROMPT='%1~${vcs_info_msg_0_} $ '

# Variables

export TERM=xterm-256color
export LANG="en-US.UTF-8"
export EDITOR=nvim
export GIT_EDITOR=nvim
export N_PREFIX=$HOME/.local/src/n # Node version manager install directory
export RUST_ROOT=$HOME/.cargo/env
export LOCAL_BIN=$HOME/.local/bin

# Path

if [ $(eval uname) = "Darwin" ]; then
  export BREW_PATH=/opt/homebrew/bin
  export PATH=$BREW_PATH:$PATH
fi

export PATH=$RUST_ROOT:$LOCAL_BIN:$N_PREFIX/bin:$PATH

# ZSH extentions

if [ -f "$HOME/.local/src/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HOME/.local/src/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
  echo 'zsh-autosuggestions was not found'
fi

if [ -d "$HOME/.local/src/zsh-completions/src" ]; then
  fpath=("$HOME/.local/src/zsh-completions/src" $fpath) # add completions
else
  echo 'zsh-completions was not found'
fi

if [ -f "$HOME/.local/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOME/.local/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
  echo 'zsh-syntax-highlighting was not found'
fi

# Programs

if [ -f "$HOME/.local/src/z/z.sh" ]; then
  source "$HOME/.local/src/z/z.sh"
else
  echo 'z (jump around) was not found'
fi

# Aliases

alias vil='vim -c "set background=light"'
alias vi='nvim'
alias vim='nvim'
alias reload='. ~/.zshrc'
alias l='ls -al'
alias ll='ls -al'
alias oss='cd ~/Code/OSS'
alias work='cd ~/Code/Work'
alias dotfiles='cd ~/Code/OSS/dotfiles'
alias ta='tmux attach'
alias tl='tmux ls'
alias gs='git status'
alias gl='git log --oneline'
alias gc='git commit'
alias ga='git add'

# Private

[ -f ~/.zsh_private ] && source ~/.zsh_private

# [ -f "/Users/gustaf/.ghcup/env" ] && source "/Users/gustaf/.ghcup/env" # ghcup-envexport PATH="/opt/homebrew/opt/llvm/bin:$PATH"
