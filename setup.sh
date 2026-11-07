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

# Herdr agent status in the menu bar (needs Herdr.app installed)
function setup_swiftbar {
    echo "Setting up SwiftBar"
    brew list --cask swiftbar >/dev/null 2>&1 || brew install --cask swiftbar
    mkdir -p ~/.config/swiftbar
    ln -sf `pwd`/swiftbar/herdr.5s.sh ~/.config/swiftbar/herdr.5s.sh
    defaults write com.ameba.SwiftBar PluginDirectory -string "$HOME/.config/swiftbar"
    # Herdr's corner note is enough once the menu bar shows status, so mute its sounds
    settings=~/.config/herdr-app/settings.json
    if [ -f $settings ]; then
        jq '.sounds.enabled = false' $settings > $settings.tmp && mv $settings.tmp $settings
    fi
    open -a SwiftBar
    echo "Turn on Launch at Login in SwiftBar's preferences"
}

while getopts ":spb" opt; do
  case $opt in
    s)
      create_sym_links
      ;;
    b)
      setup_swiftbar
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done
