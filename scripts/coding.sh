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

#######################################
# installs pnpm, a npm alternative
#######################################
pnpm_install() {
  curl -fsSL https://get.pnpm.io/install.sh | sh -
}

claude_code_install() {
  curl -fsSL https://claude.ai/install.sh | bash
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
# installs `kubectl`
#######################################
k8s_install() {
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
}
