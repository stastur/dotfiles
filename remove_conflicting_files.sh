#!/bin/bash

for file in $(find */ -type f | sed "s|^.*//||"); do
  if [ -e "$HOME/$file" ]; then
    echo "Removing $file..."
    rm "$HOME/$file"
  fi
done
