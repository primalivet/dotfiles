# Retrive git information
# This function, if in a git repository, will echo a string representing the
# current git branch, if it's dirty or not, and show the steps during a rebase.
git_prompt_info() {
  if git rev-parse --is-inside-work-tree &> /dev/null; then
    local branch=$(git symbolic-ref --short HEAD 2> /dev/null)
    local git_status=""
    local rebase_commit=""

    if [ -d "$(git rev-parse --git-dir)/rebase-merge" ]; then
      local current_step=$(cat "$(git rev-parse --git-dir)/rebase-merge/msgnum")
      local total_steps=$(cat "$(git rev-parse --git-dir)/rebase-merge/end")
      rebase_commit=$(cat "$(git rev-parse --git-dir)/rebase-merge/current_commit")
      git_status="REBASING $current_step/$total_steps"
    elif [ -d "$(git rev-parse --git-dir)/rebase-apply" ]; then
      if [ -f "$(git rev-parse --git-dir)/rebase-apply/rebasing" ]; then
        local current_step=$(cat "$(git rev-parse --git-dir)/rebase-apply/next")
        local total_steps=$(cat "$(git rev-parse --git-dir)/rebase-apply/last")
        rebase_commit=$(cat "$(git rev-parse --git-dir)/rebase-apply/last")
        git_status="REBASING $current_step/$total_steps"
      elif [ -f "$(git rev-parse --git-dir)/rebase-apply/applying" ]; then
        git_status="AM"
      else
        git_status="REBASING"
      fi
    else
      if git diff --quiet && git diff --cached --quiet; then
        git_status="OK"
      else
        git_status="DIRTY"
      fi
    fi

    if [ -n "$rebase_commit" ]; then
      echo " $rebase_commit $git_status"
    else
      echo " $branch $git_status"
    fi
  fi
}

PS1='\W$(git_prompt_info) \$ '
# The primary prompt string. The default value is ‘\s-\v\$ ’. See Controlling
# the Prompt, for the complete list of escape sequences that are expanded
# before PS1 is displayed.
