#!/bin/bash

function create_sym_links {
    echo "Creating Sym Links"
    ln -sf `pwd`/.bash_prompt ~
    ln -sf `pwd`/.bash_aliases ~
    ln -sf `pwd`/.bash_misc ~
    ln -sf `pwd`/.gitconfig ~
    ln -sf `pwd`/.tmux.conf ~
    ln -sf `pwd`/.vimrc ~
}

function add_source_to_profile {
    echo "Adding sources to .profile"
    echo "source ~/.bash_prompt" >> ~/.profile
    echo "source ~/.bash_aliases" >> ~/.profile
    echo "source ~/.bash_misc" >> ~/.profile
}

while getopts ":sp" opt; do
  case $opt in
    s)
      create_sym_links
      ;;
    p)
      add_source_to_profile
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done
