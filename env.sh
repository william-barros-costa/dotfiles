#!/bin/bash

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="i3,nvim,tmux"
    export STOW_FOLDERS
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
    export DOTFILES
fi

