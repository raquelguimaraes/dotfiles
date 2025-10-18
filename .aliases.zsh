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
alias dprune='docker system prune --volumes -a'
alias dvp='docker volume prune -a'
alias drun='(){docker run -it -v `pwd`:/data $1 /bin/bash;}'
alias dclean='drm ; dvp -a -f ; docker network prune -f'

alias ssh-walla='ssh-add -D && ssh-add ~/.ssh/id_walla'
alias ssh-per='ssh-add -D && ssh-add ~/.ssh/id_per'


alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
