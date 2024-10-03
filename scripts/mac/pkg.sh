install_brew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

packages=(
  lld
  htop
  neofetch
  tree
  bat
  jq
  fd
  mercurial
  stow
  fswatch
  pkg-config
  gh
  direnv
  fzf # add a `source <(fzf --zsh)`
)

install_packages() {
  brew install "${packages[@]}"
}
