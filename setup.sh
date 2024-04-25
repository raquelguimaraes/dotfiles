function create_sym_links {
    echo "Creating Sym Links"
    # ln -sf `pwd`/.aliases.zsh $ZSH_CUSTOM/aliases.zsh TODO: Figure out why this doesnt work during script execution
    ln -sf `pwd`/.gitconfig ~
    ln -sf `pwd`/.gitconfig-tw ~
    ln -sf `pwd`/.gitconfig-client ~
    ln -sf `pwd`/.gitconfig-personal ~
    ln -sf `pwd`/.tmux.conf ~
    ln -sf `pwd`/.vimrc ~
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
