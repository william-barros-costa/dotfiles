#!/bin/bash

if [[ -z $XDG_CONFIG_HOME ]]; then
    XDG_CONFIG_HOME="$HOME/.config"
    export XDG_CONFIG_HOME 
fi

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="i3,nvim,tmux"
    export STOW_FOLDERS
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
    export DOTFILES
fi

