#!/usr/bin/env bash

. ./packages.sh
. ./rustup.sh
. ./coding.sh
. ./zsh.sh
. ./tmux.sh
. ./logging.sh
. ./golang.sh

main() {
  info "setting up ubuntu(wsl) terminal environment..."

  title "Apt Packages"
  install_apt_wrapper
  install_packages
  # install_wsl_packages # uncomment if installing in wsl
  # post_process_packages
  success "Finished installing apt packages."

  title "Rustup Toolchain & Bob-nvim"
  rustup_toolchain
  non_nix_cargo_binaries
  bob_nvim
  success "Finished installing rustup toolchain and bob-nvim."

  title "Go Toolchain"
  golang_install
  golang_tools
  success "Finished installing golang toolchain and tools."

  title "Coding Tools"
  uv_install
  fnm_install
  pnpm_install
  sdkman_install
  claude_code_install
  # dotnet_install
  success "Finished installing coding tools."

  title "Zsh & tmux"
  zsh_setup
  zsh_plugins
  zsh_completions
  tmux_tpm
  success "Finished setting up zsh & tmux."

  title "Stowing"
  cd ..
  stow --adopt common
  stow --adopt home
  git restore .
  stow config -t ~/.config
  stow .cargo -t ~/.cargo

  warn "delete ~/infra if it is a production server and use vps-infra repository instead"

  success "Finished stowing."

  success "Finished setting up. Please restart terminal."
}

main
