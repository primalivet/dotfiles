function fish_prompt
  set -l last_status $status
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showcolorhints true
  if test $HOME = $PWD
    echo -n '~'
  else
    echo -n (basename $PWD)
  end
  echo -n (fish_git_prompt)
  set_color normal
  echo -n ' $ '
end
