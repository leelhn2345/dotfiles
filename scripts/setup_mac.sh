#!/usr/bin/env bash

. ./logging.sh
. ./packages.sh
. ./rustup.sh
. ./coding.sh
. ./zsh.sh
. ./tmux.sh

main() {
  info "setting up mac environment"

  title "rustup toolchain & bob-nvim"
  rustup_stable_toolchain
  success "finished installing rustup toolchain"

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
