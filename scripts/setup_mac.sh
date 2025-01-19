#!/usr/bin/env bash

. ./logging.sh
. ./rustup.sh
. ./zsh.sh
. ./tmux.sh

NIX_DARWIN_FLAKE="$HOME/dotfiles/nix-darwin#mac"

nix_darwin() {
  sh <(curl -L https://nixos.org/nix/install)
  nix flake init -t nix-darwin/master --extra-experimental-features "nix-command flakes"
  nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake "$NIX_DARWIN_FLAKE"
  darwin-rebuild switch --flake "$NIX_DARWIN_FLAKE"
}

main() {
  info "setting up mac environment"

  title "setup nix"
  nix_darwin
  success "finished setting up nix-darwin"

  title "rustup toolchain"
  nix_stable_toolchain
  success "finished installing rustup toolchain"

  title "zsh & tmux"
  zsh_plugins
  mac_zsh_completions
  tmux_tpm
  success "finished setting up zsh & tmux"

  title "stowing"
  cd ..

  # stow files
  stow --adopt common
  rm ~/.zshrc
  stow --adopt mac
  git checkout -- .
  stow config -t ~/.config
  stow .cargo -t ~/.cargo

  # symlink files
  # ln -sf ~/dotfiles/.ignore ~/.ignore
  # ln -sf ~/dotfiles/.wezterm.lua ~/.wezterm.lua

  success "Finished stowing."

  success "Finished setting up. Please restart terminal."
}

main
