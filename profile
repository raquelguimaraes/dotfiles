#sets up the color scheme for list export
export LSCOLORS=dxfxcxdxbxegedabagacad

#sets up the prompt color (currently a green similar to linux terminal)
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl'
