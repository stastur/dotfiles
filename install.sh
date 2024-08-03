#!/bin/bash

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Installing JetBrainsMono nerd font
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip \
  && unzip ./JetBrainsMono.zip -d ~/Library/Fonts \
  && rm ./JetBrainsMono.zip

brew install stow neovim fzf nvm ripgrep tmux

mkdir $HOME/workspace
mkdir $HOME/personal-projects

# TODO: do backup instead of removing
for file in $(find */ -type f | sed "s|^.*//||"); do
  if [ -e "$HOME/$file" ]; then
    echo "Removing $file..."
    rm "$HOME/$file"
  fi
done

stow --target=$HOME */
