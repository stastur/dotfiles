#!/usr/bin/env bash

selected=$(find ~/workspace ~/personal-projects ~ -mindepth 1 -maxdepth 1 -type d | fzf)

if [[ -n $selected ]]; then
  cd $selected
fi
