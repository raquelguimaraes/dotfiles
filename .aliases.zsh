alias ls='ls -G'
alias ll='ls -lah'
alias up='cd ..'

alias grep='grep --color'

alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks='tmux kill-session -t'

alias gti='git'
alias git-pull-all='find . -name .git -type d -execdir git pull -r -v ";"'

alias dstop='docker stop $(docker ps -a -q)'
alias drm='docker rm $(docker ps -a -q)'
alias drun='(){docker run -it -v `pwd`:/data $1 /bin/bash;}'
