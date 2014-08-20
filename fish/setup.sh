#!/bin/bash

function create_sym_links {
    echo "Creating Sym Links"
    ln -s `pwd`/fish_prompt.fish ~/.config/fish/functions
    ln -s `pwd`/prompt_pwd.fish ~/.config/fish/functions
}

while getopts ":sp" opt; do
  case $opt in
    s)
      create_sym_links
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done
