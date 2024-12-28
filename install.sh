#!/bin/bash

# Prepare environment variables
. env.sh

for folder in ${STOW_FOLDERS//,/ }
do
  echo "Stowing $folder"
  stow -D "$folder"
  stow "$folder"
done
