#!/usr/bin/env bash

#######################################
# installs nala, an apt wrapper
#######################################
install_apt_wrapper() {
  sudo apt-get update -y
  sudo apt-get install nala -y
}

packages=(
  zsh
  build-essential
  lld
  clang
  bottom
  neofetch
  bat
  jq
  fd-find
  libfuse2
  mercurial
  sed
  stow
  tmux
  vim
  unzip
  fswatch
  pkg-config
  libssl-dev
  libxml2-utils
  net-tools
  gh
  direnv

  # python packages
  python3-venv
  python3-pip

  # database
  postgresql-client
)

#######################################
# installs system packages
#######################################
install_packages() {
  sudo nala install "${packages[@]}" -y
  wait

  # installs latest fzf.
  #
  # debian's ppa is way too outdated.
  #
  ## to upgrade
  ##
  ## cd ~/.fzf && git pull && ./install
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  wait
  ~/.fzf/install --key-bindings --no-completion --no-update-rc
}

#######################################
# installs wsl system packages
#
# addition of `wslu`
#######################################
install_wsl_packages() {
  wsl_packages=(
    wslu
    ppa-purge
  )
  sudo nala install "${wsl_packages[@]}" -y
  wait
}

#######################################
# symlink packages
#######################################
post_process_packages() {
  mkdir -p ~/.local/bin
  ln -s "$(which fdfind)" ~/.local/bin/fd # symlink to `find`
}
