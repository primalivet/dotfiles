################################################################################
# EXPORT
################################################################################

export TERM=screen-256color
# This variable shall represent the terminal type for which output is to be
# prepared. This information is used by utilities and application programs
# wishing to exploit special capabilities specific to a terminal. The format
# and allowable values of this environment variable are unspecified.

if command -v nvim >/dev/null 2>&1;
then export EDITOR=nvim
else export EDITOR=vim
fi
# Used by programs that need to run an editor for you to modify lengthy input
# (pine, for example, uses a default editor normally, but may be configured to
# use an alternate editor, either automatically or via the ^_ key).

export VISUAL=$EDITOR
# Use the $VISUAL variable to set up a VISUAL text editor for editing text
# files on both GUI and CLI terminals. Some examples of a full-screen editor on
# Linux and Unix are: vim or vi, emacs, nano
#
# Generally, you will want to set it to the same value as the $EDITOR variable.

export BREW_PREFIX="/opt/homebrew"
# This variable points to the directory in which Homebrew is installed. All
# formulas and binaries installed with Homebrew is located in subdirectories to
# this directory.

export LOCAL_BIN=$HOME/.local/bin


################################################################################
# PATH
################################################################################

export PATH=$LOCAL_BIN:$PATH
export PATH=$BREW_PREFIX/bin/:$PATH
# This variable shall represent the sequence of path prefixes that certain
# functions and utilities apply in searching for an executable file known only
# by a filename. The prefixes shall be separated by a <colon> ( ':' ). When a
# non-zero-length prefix is applied to this filename, a <slash> shall be
# inserted between the prefix and the filename if the prefix did not end in
# <slash>. A zero-length prefix is a legacy feature that indicates the current
# working directory. It appears as two adjacent <colon> characters ( "::" ), as
# an initial <colon> preceding the rest of the list, or as a trailing <colon>
# following the rest of the list. A strictly conforming application shall use
# an actual pathname (such as .) to represent the current working directory in
# PATH. The list shall be searched from beginning to end, applying the filename
# to each prefix, until an executable file with the specified name and
# appropriate execution permissions is found. If the pathname being sought
# contains a <slash>, the search through the path prefixes shall not be
# performed. If the pathname begins with a <slash>, the specified path is
# resolved (see Pathname Resolution). If PATH is unset or is set to null, the
# path search is implementation-defined.
#
# Since <colon> is a separator in this context, directory names that might be
# used in PATH should not include a <colon> character.

################################################################################
# BASH VARIABLES
################################################################################
# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html

export HISTCONTROL=ignorespace:ignoredups:erasedups
# A colon-separated list of values controlling how commands are saved on the
# history list. If the list of values includes ‘ignorespace’, lines which begin
# with a space character are not saved in the history list. A value of
# ‘ignoredups’ causes lines which match the previous history entry to not be
# saved. A value of ‘ignoreboth’ is shorthand for ‘ignorespace’ and
# ‘ignoredups’. A value of ‘erasedups’ causes all previous lines matching the
# current line to be removed from the history list before that line is saved.
# Any value not in the above list is ignored. If HISTCONTROL is unset, or does
# not include a valid value, all lines read by the shell parser are saved on
# the history list, subject to the value of HISTIGNORE. The second and
# subsequent lines of a multi-line compound command are not tested, and are
# added to the history regardless of the value of HISTCONTROL.

export HISTFILE=~/.bash_history
# The name of the file to which the command history is saved. The default value
# is ~/.bash_history.

export HISTFILESIZE=500000
# The maximum number of lines contained in the history file. When this variable
# is assigned a value, the history file is truncated, if necessary, to contain
# no more than that number of lines by removing the oldest entries. The history
# file is also truncated to this size after writing it when a shell exits. If
# the value is 0, the history file is truncated to zero size. Non-numeric
# values and numeric values less than zero inhibit truncation. The shell sets
# the default value to the value of HISTSIZE after reading any startup files.

export HISTSIZE=$HISTFILESIZE
# The maximum number of commands to remember on the history list. If the value
# is 0, commands are not saved in the history list. Numeric values less than
# zero result in every command being saved on the history list (there is no
# limit). The shell sets the default value to 500 after reading any startup
# files.

# unset PROMPT_COMMAND
# If this variable is set, and is an array, the value of each set element is
# interpreted as a command to execute before printing the primary prompt
# ($PS1). If this is set but not an array variable, its value is used as a
# command to execute instead.
#
# export PROMPT_COMMAND="history -n;history -w;history -c;history -r;$PROMPT_COMMAND"
# HINT: The above value of this command append new history lines (-n), writes
# (-w) history which trigger "erasedups", clear (-c) the history list, read
# (-r) the history file.

################################################################################
# ALIAS
################################################################################

alias vi='nvim'
alias reload='. ~/.bash_profile && bind -f ~/.inputrc'
alias ls='ls --color'
alias ll='ls -al'
alias ..='cd ..'
alias ~="cd $HOME"
alias ta='tmux attach'
alias tl='tmux ls'

################################################################################
# OPTIONS
################################################################################
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

shopt -s histappend;
# If set, the history list is appended to the file named by the value of the
# HISTFILE variable when the shell exits, rather than overwriting the file.

################################################################################
# BREW BASH COMPLETION
################################################################################

if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

################################################################################
# FUNCTIONS
################################################################################

# Fuzzy change project directory ([C]hange directory)
function c() {
  directory="$(find ~/Code -maxdepth 2 -type d | fzf)"
  if [ $? -ne 0 ]; then
    return # exit if prev command was canceled
  fi
  if [ -n "$directory" ]; then
    cd "$directory" || return
  fi
}

# Pattern kill Tmux sessions ([T]mux [K]ill)
function tk() {
  tmux ls | sed "s/://"  | awk '{print $1}' | grep $1 | xargs -I{} tmux kill-session -t {}
}

# Fuzzy start new Tmux session ([T]mux [N]new)
function tn() {
  directory_path="$(find ~/Code -maxdepth 2 -type d | fzf)"
  if [ $? -ne 0 ]; then
    return # exit if prev command was canceled
  fi
  directory="$(basename $directory_path)"
  existing_session="$(tmux ls 2>/dev/null | awk '{ print $1 }' | sed 's/://' | grep $directory)"

  if [ -n "$existing_session" ]; then
    if [[ -n "$TMUX" ]]; then
      tmux switch-client -t "$existing_session"
    else
      tmux attach -t "$matching_session"
    fi
  else
    if [ -n "$TMUX" ]; then
      tmux new -d -s "$directory" -c "$directory_path"
      tmux switch-client -t "$directory"
    else
      tmux new -s "$directory" -c "$directory_path"
    fi
  fi
}

if [ -f ~/.bash_private ]; then
  source ~/.bash_private
fi
