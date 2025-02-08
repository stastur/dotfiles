export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

bindkey -s ^f "tmux-sessionizer\n"

appendPath() {
  if [[ "$PATH" != *"$1"* ]]; then
    export PATH="$PATH:$1"
  fi
}

prependPath() {
  if [[ "$PATH" != *"$1"* ]]; then
    export PATH="$1:$PATH" 
  fi
}

prependPath $(go env GOPATH)/bin
prependPath /usr/local/bin
prependPath $HOME/bin
prependPath $HOME/Library/pnpm
appendPath $HOME/.local/scripts
