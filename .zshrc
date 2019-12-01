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
alias repo='cd ~/Repo'
alias gogh='cd ~/go/src/github.com/'
alias vimrc='vim ~/.vimrc'
alias gsquash='git reset --soft HEAD~2 && git commit -m'
alias python='python3'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh