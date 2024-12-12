#!/usr/bin/env bash

# TODO: mac empty commands
# need to fill up these functions
. ./logging.sh
. ./packages.sh
. ./rustup.sh
. ./coding.sh
. ./zsh.sh
. ./tmux.sh

main() {
  info "setting up mac environment"

  title "packages"
  install_brew
  install_packages
  success "finished installing packages"

  title "rustup toolchain & bob-nvim"
  rustup_toolchain
  cargo_binaries
  bob_nvim
  success "finished installing rustup toolchain and bob-nvim"

  title "coding tools"
  uv_install
  nvm_install
  bun_install
  success "finished installing coding tools"

  title "zsh & tmux"
  zsh_plugins
  mac_zsh_completions
  tmux_tpm
  success "finished setting up zsh & tmux"

  title "stowing"
  cd ..
  cp .ignore ~
  stow --adopt common
  rm ~/.zshrc
  stow --adopt mac
  git checkout -- .
  stow config -t ~/.config
  stow .cargo -t ~/.cargo
  stow --adopt wezterm

  success "Finished stowing."

  success "Finished setting up. Please restart terminal."
}

main
