#!/bin/bash

# Prepare environment variables
. env.sh

cp -f ".bashrc" ~
cp -f ".profile" ~

for folder in ${STOW_FOLDERS//,/ }
do
  echo "Stowing $folder"
  stow -t ~ "$folder"
  stow -t ~ "$folder"
done

