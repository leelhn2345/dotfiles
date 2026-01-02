#!/usr/bin/env bash

if ! cd "scripts" >/dev/null; then
  echo "error changing directory in $(pwd)"
  exit 1
fi

. ./packages.sh
. ./rustup.sh
. ./coding.sh
. ./zsh.sh
. ./logging.sh
. ./tmux.sh

export TERM=xterm-256color

main() {
  info "setting up devpod..."

  title "Apt Packages"
  install_apt_wrapper
  install_packages
  post_process_packages
  success "Finished installing apt packages."

  title "Rustup Toolchain & Bob-nvim"
  rustup_toolchain
  non_nix_cargo_binaries
  bob_nvim
  success "Finished installing rustup toolchain and bob-nvim."

  title "Coding Tools"
  uv_install
  nvm_install
  pnpm_install
  golang_install
  "$HOME/.bun/bin/bun" i -g @loopback/cli git-removed-branches
  success "Finished installing coding tools."

  title "Zsh & Tmux"
  zsh_setup
  zsh_plugins
  zsh_completions
  tmux_tpm
  success "Finished setting up zsh & tmux."

  title "Stowing"
  cd ../..
  mv dotfiles ~
  cd ~/dotfiles || {
    err "could not \`cd\` into dotfiles"
    exit 1
  }
  cp .ignore ~ # whitelisting `.env` for ripgrep and fd-find
  stow --adopt common
  stow --adopt devpod
  git restore .
  stow config -t ~/.config
  success "Finished stowing."

  success "Devpod has been setup. You may ssh now."
}

main
