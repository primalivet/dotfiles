# if not running interactively, don't do anything
case $- in
		*i*) ;;
		*) return;;
esac

# check if terminal emulator supports color
case "$TERM" in
		xterm-color|*-256color) support_color=yes;;
esac

# add datetime for each command in the history eg. Dec 16 13:33:37
export HISTTIMEFORMAT="%h %d %H:%M:%S"

# increase history size
export HISTSIZE=10000
export HISTFILESIZE=10000

# dont save lines which begin with a <space> character and lines equal to previous line
export HISTCONTROL=ignorespace:ignoredups:eracedups

# trim pwd in prompt
PROMPT_DIRTRIM=1

# append to history, don't overwrite
shopt -s histappend

# after each command, append to history and re-read history (this should make
# history  presistant across terminals)
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# set node version manager enviroment variable
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf
export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ag/.ignore --hidden -g ""'
export FZF_DEFAULT_OPTS='--height 100% --color=hl:13,hl+:13,fg+:11,marker:11,border:8,prompt:-1,pointer:11,spinner:-1,bg+:-1,bg:-1,spinner:-1,info:-1,fg:-1'

# check for dircolors support and load .dircolors if it exists
if [ -x /usr/bin/dircolors ]; then
		test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# some aliases
alias docker='echo "Running docker in Powershell"; powershell.exe docker'
alias docker-compose='echo "Running docker-compose in Powershell"; powershell.exe docker-compose'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi=nvim

if [ -f ~/.bash_private ]; then
		. ~/.bash_private
fi

# check if inside git controlled dir, if yes parse branch name
# 2 optional arguments: $1 is the git branch string prefix and $2 suffix
function parse_git_branch() {
		local branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
		if [ ! "$branch" == "" ]; then
				echo "${1:-}${branch}${2:-}"
		else
				echo ""
		fi
}

# get current status of git repo
# 2 optional arguments: $1 is the git branch string prefix and $2 suffix
function parse_git_dirty {
		status=`git status 2>&1 | tee`
		dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
		untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
		ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
		newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
		renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
		deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
		local bits=''
		if [ "${renamed}" == "0" ]; then
				bits=">${bits}"
		fi
		if [ "${ahead}" == "0" ]; then
				bits="*${bits}"
		fi
		if [ "${newfile}" == "0" ]; then
				bits="+${bits}"
		fi
		if [ "${untracked}" == "0" ]; then
				bits="?${bits}"
		fi
		if [ "${deleted}" == "0" ]; then
				bits="x${bits}"
		fi
		if [ "${dirty}" == "0" ]; then
				bits="!${bits}"
		fi
		if [ ! "${bits}" == "" ]; then
				echo "${1:-}$bits${2:-}"
		else
				echo "${2:-}"
		fi
}

# WITH HOST export PS1="\u@\h:\w\`parse_git_branch ':' \`\`parse_git_dirty ':'\`\$ "
export PS1="\u:\w\`parse_git_branch ':' \`\`parse_git_dirty ':'\`\$ "

export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$PATH:/usr/local/go/bin

export EDITOR=nvim

export YVM_DIR=/home/primalivet/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh


# Setup fzf
if [[ ! "$PATH" == *~/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}~/.fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "~/.fzf/shell/completion.bash" 2> /dev/null
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/.bash_completion
