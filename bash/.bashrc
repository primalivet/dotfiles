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
export HISTCONTROL=ignorespace:ignoredups

# trim pwd in prompt
PROMPT_DIRTRIM=2

# append to history, don't overwrite
shopt -s histappend

# set node version manager enviroment variable
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# some aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

PS1="\u@\h:\w\`parse_git_branch ':' \`\`parse_git_dirty ':'\`\$ "


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export YVM_DIR=/home/primalivet/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
