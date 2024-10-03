#!/usr/bin/env bash

# TODO: mac empty commands
# need to fill up these functions
. ./logging.sh
. ./mac/pkg.sh

main() {
  info "setting up mac environment"

  title "packages"
  install_brew
  install_packages

  post_process_packages
  success "finished installing packages"

  title "rustup toolchain & bob-nvim"
  rustup_toolchain
  cargo_binaries
  bob_nvim
  succes "finished installing rustup toolchain and bob-nvim"

  title "coding tools"
  uv_install
  nvm_install
  bun_install
  success "finished installing coding tools"

  title "zsh & tmux"
  zsh_setup
  zsh_plugins
  zsh_completions
  tmux_tpm
  success "finished setting up zsh & tmux"

  title "stowing"
  cd ..
  cp .ignore ~
  stow --adopt common
  stow --adopt home
  git checkout -- .
  stow config -t ~/.config
  stow .cargo -t ~/.cargo

  warn "delete ~/infra if it is a production server and use vps-infra repository instead"

  success "Finished stowing."

  success "Finished setting up. Please restart terminal."
}

main
