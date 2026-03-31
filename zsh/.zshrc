export ZSH="$HOME/.oh-my-zsh"

alias vim="nvim"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

bindkey -s ^f "tmux-sessionizer\n"

export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/Library/pnpm"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/scripts"
