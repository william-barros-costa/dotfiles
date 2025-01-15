#   ----------
#  | Aliases |
#  ----------

# -A all except ./ ../
# -C in columns
# -l list owners
# -F add ending (such as / for folders)
alias ls='ls --color'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'

alias ga="git add"
alias gc="git commit -m"

alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias r='cd $OLDPWD'
alias c='clear'

alias k='kubectl'
alias runssh='docker run --rm -it --volume "$SSH_AUTH_SOCK":/ssh-agent --env SSH_AUTH_SOCK=/ssh-agent'
alias runws='docker run --rm -it -v "$(pwd):/workspace" -w /workspace'
alias d='docker'
alias dc='docker-compose'
alias dcb='docker-compose build'
alias bake='docker buildx bake'

alias .bashrc='source ~/.bashrc'
alias .profile='source ~/.profile'

alias n="nvim"
alias nvi="nvim"
alias nv="nvim"
alias vim="nvim"
alias vi="nvim"

#   ----------
#  | Exports |
#  ----------
# export VIM="nvim"
export EDITOR="nvim"

#   ------------
#  | Functions |
#  ------------
mkcd(){
  mkdir -p "$1" && cd "$1" || exit
}

parse_git_branch(){
  if git rev-parse --git-dir > /dev/null 2>&1; then
    echo "($(git branch --show-current 2>/dev/null))"
  fi
}

yq(){
  docker run --rm -i -v "${PWD}":/workdir mikefarah/yq "$@"
}

_call_navi(){
  local selected
  selected=$(navi --print </dev/tty)

  if [[ -n $selected ]]; then
    READLINE_LINE="${READLINE_LINE}${selected}"
    READLINE_POINT="${#READLINE_LINE}"
  fi
}

#   ---------------------
#  | Command Completion |
#  ---------------------
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
  if command -v kubectl &>/dev/null
  then
    source <(kubectl completion bash)
    complete -F __start_kubectl k
  fi
fi

#   -------
#  | BASH |
#  -------
bash_header="\[\e[0;35m\]$(parse_git_branch) \[\e[0m\]\[\e[0;36m\]\u\[\e[0m\]:\[\e[0;33m\]\w\[\e[0m\] -> "
export PS1="$bash_header"

# Set portuguese keyboard layout
setxkbmap -layout pt 2>/dev/null


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash 2>/dev/null
[ -f ~/.cargo/bin/navi ] && export PATH="${PATH}:/home/ubuntu22/.cargo/bin"

export XDG_CONFIG_HOME="$HOME/.config"
