# helper function to check if command exists
command_exists() {
  type "$1" &> /dev/null
}

# append to the history file
shopt -s histappend

# check the window size after each command ($LINES, $COLUMNS)
shopt -s checkwinsize

# bash autocomplete
[ -f /etc/bash_completion ] && . /etc/bash_completion

# history
export HISTCONTROL=ignoreboth:erasedups

export TERM=xterm-256color

export EDITOR=vim

# update path with home/bin
export PATH=$HOME/bin:$PATH 

# add go lang to path
export PATH=/usr/local/go/bin:$PATH

# add ~./.npm-global to path
export PATH=$HOME/.npm-global-packages:$PATH 

# aliases
alias ls='ls --color'
alias l='ls -A'
alias ll='ls -Al'

# edit sl colors, remove dir backgrounds
LS_COLORS='tw=30:ow=34'

export LS_COLORS

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]; then
    STAT=`parse_git_dirty`
    #echo "[${BRANCH}${STAT}]"
    echo " on ${BRANCH}"
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
    echo "${bits}"
  else
    echo ""
  fi
}

function nonzero_return() {
  RETVAL=$?
  [ $RETVAL -ne 0 ] && echo "error: $RETVAL " 
}

#export PS1="\W\`parse_git_branch\` \\$ "
export PS1="\W\`parse_git_branch\`\[\e[31m\]\`parse_git_dirty\`\[\e[m\] \\$ "
