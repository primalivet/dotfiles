function c() {
  directory="$(find ~/Code -maxdepth 2 -type d | fzf)"
  if [[ $? -ne 0 ]]; then
    return # exit if prev command was canceled
  fi
  if [[ ! -z "$directory" ]] && cd $directory;
}

function tk() {
  tmux ls | sed "s/://"  | awk '{print $1}' | grep $1 | xargs -I{} tmux kill-session -t {}
}

function tn() {
  directory_path="$(find ~/Code -maxdepth 2 -type d | fzf)"
  if [[ $? -ne 0 ]]; then
    return # exit if prev command was canceled
  fi
  directory="$(basename $directory_path)"
  existing_session="$(tmux ls 2>/dev/null | awk '{ print $1 }' | sed 's/://' | grep $directory)"

  if [[ -n "$existing_session" ]]; then
    if [[ -n "$TMUX" ]]; then
      tmux switch-client -t $existing_session
    else
      tmux attach -t $matching_session
    fi
  else
    if [[ -n "$TMUX" ]]; then
      tmux new -d -s $directory -c $directory_path
      tmux switch-client -t $directory
    else
      tmux new -s $directory -c $directory_path
    fi
  fi
}
