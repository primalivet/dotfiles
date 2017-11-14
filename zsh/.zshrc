# add ~/.bin to PATH
export PATH=$HOME/bin:$PATH

# add ~/.npm-global to PATH
export PATH=$HOME/.npm-global:$PATH

# add ~/.rbenv/bin to PATH
export PATH=$HOME/.rbenv/bin:$PATH

# Load rbenv automatically by appending
# the following to ~/.zshrc: 
eval "$(rbenv init -)"

# Path to your oh-my-zsh installation.
export ZSH=/home/gustaf/.oh-my-zsh

ZSH_THEME="primalivet"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
