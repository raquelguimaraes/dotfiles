export ZSH=$HOME/.oh-my-zsh

function get_cluster_short() {
      echo "$1" | cut -d : -f6 | cut -d / -f2
  }
export KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_CTX_COLOR=magenta
export KUBE_PS1_PREFIX=[
export KUBE_PS1_SUFFIX=]

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export NVM_AUTOLOAD=1

ZSH_DISABLE_COMPFIX="true"

ZSH_THEME="amuse"

plugins=(
    git
#    kube-ps1
#    nvm
)

source $ZSH/oh-my-zsh.sh

alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks='tmux kill-session -t'

alias gti='git'
alias k='kubectl'

alias git-pull-all='find . -name .git -type d -execdir git pull -r -v ";"'

alias sshcos='ssh-add ~/.ssh/id_cos'

alias dstop='docker stop $(docker ps -a -q)'
alias drm='docker rm $(docker ps -a -q)'
alias drun='(){docker run -it -v `pwd`:/data $1 /bin/bash;}'
