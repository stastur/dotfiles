export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

bindkey -s ^f "source ~/fzf.sh\n"

export PATH=$HOME/bin:/usr/local/bin:$(go env GOPATH)/bin:$PATH
