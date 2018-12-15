if [ "$TMUX" = "" ]; then tmux; fi

export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH:/usr/local/go/bin
export GPG_TTY=$(tty)
export SSH_KEY_PATH="~/.ssh/rsa_id"

RPROMPT='$(git_prompt_info) %F{blue}] %F{green}%D{%H:%M}'
ZSH_THEME="woat"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

alias bs='browser-sync start --server  --files="**/*"'
alias gome='cd ~/go/src/github.com/woat'
alias gogh='cd ~/go/src/github.com/'
alias vimrc='vim ~/.vimrc'
alias gsquash='git reset --soft HEAD~2 && git commit -m'
