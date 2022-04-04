export EDITOR=nvim
export GIT_EDITOR=nvim

# Node version manager install directory
export N_PREFIX=$HOME/.n

export DOTNET_ROOT=$HOME/.dotnet
# Homebrew/Linuxbrew paths
[[ $(eval uname) = "Darwin" ]] && export BREW_PATH=/opt/homebrew/bin
[[ $(eval uname) = "Linux" ]] && export BREW_PATH=/home/linuxbrew/.linuxbrew/bin
[[ $(eval uname) = "Darwin" ]] && source /opt/homebrew/etc/profile.d/z.sh
[[ $(eval uname) = "Linux" ]] && source /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh

# Path
export PATH=$HOME/.dotnet:$HOME/.dotnet/tools:$N_PREFIX/bin:$BREW_PATH:$HOME/.local/bin:/opt/homebrew/opt/llvm/bin:$PATH

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

# Load private/computer specific stuff
[ -f ~/.zsh_private ] && source ~/.zsh_private

# Oh My Zsh
export ZSH=$HOME/.oh-my-zsh
[[ $(eval uname) = "Darwin" ]] && export FZF_BASE=/opt/homebrew/opt/fzf
[[ $(eval uname) = "Linux" ]] && export FZF_BASE=/home/linuxbrew/.linuxbrew/opt/fzf
export FZF_DEFAULT_OPTS='--height=100%'
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions fzf)
source $ZSH/oh-my-zsh.sh

[ -f "/Users/gustaf/.ghcup/env" ] && source "/Users/gustaf/.ghcup/env" # ghcup-envexport PATH="/opt/homebrew/opt/llvm/bin:$PATH"
