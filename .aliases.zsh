alias ls='eza'
alias ll='eza -la --no-time --group-directories-first'
alias lt='eza --tree'

alias cat='bat --theme=1337'

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
alias dprune='docker system prune --volumes'
alias drun='(){docker run -it -v `pwd`:/data $1 /bin/bash;}'

alias ssh-tw='ssh-add -D && ssh-add ~/.ssh/id_tw'
alias ssh-client='ssh-add -D && ssh-add ~/.ssh/id_client'
alias ssh-per='ssh-add -D && ssh-add ~/.ssh/id_per'
