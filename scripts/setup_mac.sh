#!/usr/bin/env bash

. ./logging.sh
. ./rustup.sh
. ./zsh.sh
. ./tmux.sh

nix_darwin() {
  sh <(curl -L https://nixos.org/nix/install)
  nix flake init -t nix-darwin/master --extra-experimental-features "nix-command flakes"
  nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/dotfiles/config/nix#mac
  darwin-rebuild switch --flake ~/dotfiles/config/nix-darwin#mac
}

main() {
  info "setting up mac environment"

  title "setup nix"
  nix_darwin
  success "finished setting up nix-darwin"

  title "rustup toolchain"
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
  ln -sf ~/dotfiles/.wezterm.lua ~/.wezterm.lua
  success "Finished stowing."

  success "Finished setting up. Please restart terminal."
}

main
