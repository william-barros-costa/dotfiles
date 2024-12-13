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
  mkdir -p "$1" && cd "$1"
}

parse_git_branch(){
  git rev-parse --is-inside-work-tree >/dev/null 2>%1

  if [ $? -eq 0 ]; then
    echo "($(git branch --show-current 2>/dev/null))"
  fi
}

yq(){
  docker run --rm -v "${PWD}":/workdir mikefarah/yq "$@"
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
  source <(kubectl completion bash)
  complete -F __start_kubectl k
fi

#   -------
#  | BASH |
#  -------
export PS1="\[\e[0;35m\]$(parse_git_branch) \[\e[0m\]\[\e[0;36m\]\u\[\e[0m\]:\[\e[0;33m\]\w\[\e[0m\] -> "
