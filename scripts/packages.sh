#!/usr/bin/env bash

#######################################
# installs nala, an apt wrapper
#######################################
install_apt_wrapper() {
  sudo apt-get update && sudo apt-get upgrade-y
  sudo apt-get install nala -y

  # this is to wrap all `apt` commands with `nala`.
  sudo mv /usr/bin/apt /usr/bin/apt.bak
  sudo tee /usr/bin/apt <<'EOF'
#!/bin/bash
exec nala "$@"
EOF
  sudo chmod +x /usr/bin/apt

  # to undo the above, just remove existing /usr/bin/apt and restore the .bak file
}

packages=(
  zsh
  build-essential
  lld
  clang
  fastfetch # only works for ubuntu 25.04 or later. for earlier versions, use `neofetch`
  bat
  jq
  fd-find
  libfuse2t64
  mercurial
  stow
  zip
  unzip
  inotify-tools
  pkg-config
  libssl-dev
  libxml2-utils
  net-tools
  gh
  direnv

  # python packages
  python3-venv
  # python3-pip

  # database
  postgresql-client
  mysql-client
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
