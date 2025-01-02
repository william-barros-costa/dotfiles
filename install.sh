#!/bin/bash

# Prepare environment variables
. env.sh

cp ".bashrc" ~
cp ".profile" ~

for folder in ${STOW_FOLDERS//,/ }
do
  echo "Stowing $folder"
  stow -D "$folder"
  stow "$folder"
done

mv -f .bashrc "$HOME/.bashrc"
