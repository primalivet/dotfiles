# takes 2 optional arguments
# $1 is the git branch string prefix
# $2 is the git branch string suffix
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]; then
        STAT=`parse_git_dirty`
        echo "${1:-}${BRANCH}${2:-}"
    else
        echo ""
    fi
}

# get current status of git repo
# $1 is the git status string prefix
# $2 is the git status string suffix
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
        echo "${1:-}${bits}${2:-}"
    else
        echo ""
    fi
}

prompt() {
    PS1_SUFFIX='$ '
    case $1 in
        git)
            PS1="\u@\h:\[\033[01m\]\W\[\033[35m\]\`parse_git_branch ':'\`\[\033[31m\]\`parse_git_dirty\`\[\033[00m\]$PS1_SUFFIX"
            ;;
        '')
            source /etc/skel/.bashrc
            ;;
    esac
}

prompt "${MODE:-git}"
