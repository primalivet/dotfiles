PROMPT='%c $(git_prompt_info) $(git_prompt_status) '
PROMPT+="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="on "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[red]%}↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[magenta]%}↕%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}✎"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[cyan]%}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}♦"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}✭"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[cyan]%}$"
