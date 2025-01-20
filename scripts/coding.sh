#!/usr/bin/env bash

#######################################
# installs uv, a python package manager
#######################################
uv_install() {
  curl -LsSf https://astral.sh/uv/install.sh | sh
}

#######################################
# installs nvm - node version manager
#######################################
nvm_install() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  # shellcheck disable=SC1090
  source ~/.nvm/nvm.sh
  nvm install --lts
}

fnm_install() {
  curl -fsSL https://fnm.vercel.app/install | bash
  ./~/.local/share/fnm/fnm install --lts
}

#######################################
# installs pnpm, a npm alternative
#######################################
pnpm_install() {
  curl -fsSL https://get.pnpm.io/install.sh | env PNPM_VERSION=10.0.0 sh -
}

#######################################
# installs bun, a nodeJS and npm alternative
#######################################
bun_install() {
  curl -fsSL https://bun.sh/install | bash
  SHELL=/bin/zsh "$HOME/.bun/bin/bun" completions >~/.bun/_bun
}

#######################################
# installs dotnet
#######################################
dotnet_install() {
  sudo apt-get install -y dotnet-sdk-8.0
}

#######################################
# golang version manager - https://github.com/go-nv/goenv
#
# uses `goenv` as cmd
#######################################
golang_install() {
  git clone https://github.com/go-nv/goenv.git ~/.goenv

  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  eval "$(goenv init -)"
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"

  goenv install latest
  LATEST_GOLANG_VERSION=$(goenv versions | awk '{print $1}')
  info "installed latest golang version -- $LATEST_GOLANG_VERSION"
  goenv global "$LATEST_GOLANG_VERSION"
}
