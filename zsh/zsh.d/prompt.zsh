setopt prompt_subst

# Define a function to get the current git status
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
        git_status="%F{yellow}REBASING%f $current_step/$total_steps"
      elif [ -f "$(git rev-parse --git-dir)/rebase-apply/applying" ]; then
        git_status="%F{yellow}AM%f"
      else
        git_status="%F{yellow}REBASING%f"
      fi
    else
      if git diff --quiet && git diff --cached --quiet; then
        git_status="%F{green}OK%f"
      else
        git_status="%F{red}DIRTY%f"
      fi
    fi

    if [ -n "$rebase_commit" ]; then
      echo " $rebase_commit $git_status"
    else
      echo " $branch $git_status"
    fi
  fi
}


PROMPT='%1~$(git_prompt_info) %# '
