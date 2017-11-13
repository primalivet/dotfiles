# Setup for running ZSH at start in WSL
# if running in terminal
#if [ -t 1 ]; then
#	# if zsh is installed
#	if which zsh > /dev/null; then
#		exec zsh
#	fi
#fi

# append to the history file
shopt -s histappend

# check the window size after each command ($LINES, $COLUMNS)
shopt -s checkwinsize

# history
export HISTCONTROL=ignoreboth:erasedups

export PATH=$HOME/bin:$PATH 
export PATH=$HOME/.npm-global:$PATH 
export PATH=$HOME/.rbenv/bin:$PATH

# Load rbenv automatically by appending the following to ~/.bashrc: 
eval "$(rbenv init -)"

# aliases
alias l='ls -Al'

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]; then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]" 
  else
    echo ""
  fi
}
                      
# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
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
    echo " ${bits}"
  else
    echo ""
  fi
}

function nonzero_return() {
  RETVAL=$?
  [ $RETVAL -ne 0 ] && echo "error: $RETVAL " 
}
                                                                                                  
export PS1="\W\`parse_git_branch\`\\$ "

source=~/.bashrc
