#!/bin/bash

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install stow neovim fzf nvm ripgrep

mkdir $HOME/workspace
mkdir $HOME/personal-projects

# TODO: do backup instead of removing
for file in $(find */ -type f | sed "s|^.*//||"); do
  if [ -e "$HOME/$file" ]; then
    rm "$HOME/$file"
  fi
done

stow --target=$HOME */
