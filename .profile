#!/bin/bash

packages="tmux bash-completion tree stow"

if [ -z "$TMUX" ]
then
  if command -v apt &>/dev/null
  then
    sudo apt-get update
    eval sudo apt-get install -y "$packages"
  elif command -v pacman &>/dev/null
  then
    sudo pacman -Syu
    eval sudo pacman -S "$packages"
  fi

  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)
fi
