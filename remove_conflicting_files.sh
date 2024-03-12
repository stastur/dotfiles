#!/bin/bash

for file in $(find */ -type f | sed "s|^.*//||"); do
  if [ -e "$HOME/$file" ]; then
    rm "$HOME/$file"
  fi
done
