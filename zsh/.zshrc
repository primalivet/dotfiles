# ENVIRONMENT VARIABLES
#------------------------------------------------------------------------------

export TERM=xterm-256color

# Local (src/bin)
export LOCAL_SRC=$HOME/.local/src
export LOCAL_BIN=$HOME/.local/bin
export PATH=$LOCAL_BIN:$PATH

# Homebrew
export PATH="/opt/homebrew/bin/:$PATH"
# [[ $(eval uname) = "Darwin" ]] && export PATH="/opt/homebrew/sbin:$PATH"
# [[ $(eval uname) = "Darwin" ]] && export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# [[ $(eval uname) = "Darwin" ]] && export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# [[ $(eval uname) = "Darwin" ]] && export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# N (node version manager)
export N_PREFIX=$HOME/.local/src/n
export PATH=$N_PREFIX/bin:$PATH

export RIPGREP_CONFIG_PATH=~/.ripgreprc

# More speed (especially when going in and out of insert mode (vi))
export KEYTIMEOUT=1

if type nvim &> /dev/null; then
  export VISUAL=nvim
  export EDITOR=nvim
  export GIT_EDITOR=nvim
else
  export VISUAL=vim
  export EDITOR=vim
  export GIT_EDITOR=vim
fi

if type fzf &> /dev/null && type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git" --glob'
  export FZF_DEFAULT_OPTS="--height=100% --reverse --color=bw"
fi

[[ -f "$LOCAL_SRC/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
  source "$LOCAL_SRC/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Ocaml
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh"  > /dev/null 2> /dev/null

# Rust (cargo env script also add Rust bins to PATH)
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# History
#------------------------------------------------------------------------------

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt INC_APPEND_HISTORY_TIME # Immediately append after execution
setopt EXTENDED_HISTORY # Timestamps in history
setopt HIST_EXPIRE_DUPS_FIRST # Duplicates goes first when trimming
setopt HIST_IGNORE_DUPS # Dont record entry which was just recorded
setopt HIST_IGNORE_ALL_DUPS # Don't put duplicated command into history list
setopt HIST_SAVE_NO_DUPS # Don't save duplicated command
setopt HIST_REDUCE_BLANKS # Remove unnecessary blanks
setopt HIST_IGNORE_SPACE # Don't save entry if staring with space
setopt SHARE_HISTORY # Share history between sessions
unsetopt HIST_VERIFY # Execute commands using history (e.g.: using !$) immediately

# Completion
#------------------------------------------------------------------------------

# Add completions installed through Homebrew packages
# See: https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi


# Speed up completion (https://gist.github.com/ctechols/ca1035271ad134841284)
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt auto_pushd

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive path-completion
zstyle ':completion:*' menu select # Allow to select in completion menu

# azure specific completions
# source '/opt/homebrew/etc/bash_completion.d/az'

# Key bindings
#------------------------------------------------------------------------------

bindkey '^[[Z' reverse-menu-complete # Reverse through completion with Shift-Tab
bindkey -v # Use vi keybindings

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

bindkey '^Y' accept-search

bindkey '^?' backward-delete-char # Backspace as expected in Emacs

# FUNCTIONS
#------------------------------------------------------------------------------

function fuzzy_charge_project() {
  directory="$(find ~/Code -maxdepth 2 -type d | fzf)"
  if [[ $? -ne 0 ]]; then
    return # exit if prev command was canceled
  fi
  if [[ ! -z "$directory" ]] && cd $directory;
}

function fuzzy_start_tmux_session() {
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

# ALIASES
#------------------------------------------------------------------------------

alias history='history 1'
alias vi='nvim'
alias reload='. ~/.zshrc'
alias ls='ls --color=auto'
alias ll='ls -al'
alias ..='cd ..'
alias ~="cd $HOME"
alias ta='tmux attach'
alias tl='tmux ls'
alias tn=fuzzy_start_tmux_session
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias glo='git log --oneline'
alias glog='git log --oneline --graph'
alias gc='git commit'
alias ga='git add'
alias c=fuzzy_charge_project
alias docker=podman
alias h='history | fzf'

# PROMPT
#------------------------------------------------------------------------------

setopt prompt_subst

# Borrowed from: https://thevaluable.dev/zsh-install-configure-mouseless/
# See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
cursor_mode() {
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

git_prompt_info() {
  local dirstatus=" OK"
  local dirty=" DIRTY"

  if [[ ! -z $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
    dirstatus=$dirty
  fi

  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo " ${ref#refs/heads/}$dirstatus"
}


PROMPT='%1~$(git_prompt_info) $ '


# PRIVATE
#------------------------------------------------------------------------------

[ -f ~/.zsh_private ] && source ~/.zsh_private
