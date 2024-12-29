#!/usr/bin/env bash

#######################################
# sets up rust, cargo and cargo-binstall
#######################################
rustup_toolchain() {
  curl https://sh.rustup.rs -sSf | sh -s -- -y

  # shellcheck disable=SC1091
  source "$HOME/.cargo/env"

  rustup update
  rustup component add rust-src clippy rustfmt rust-analyzer
}

cargo_crates=(
  "ripgrep"
  "lsd"
  "zoxide"
  "cargo-update"
  # "tree-sitter-cli"
  # "cargo-makedocs"
  "cargo-watch"
  "cargo-nextest"
  "cargo-autoinherit"
  "cargo-machete"
  "jaq"
  "git-delta"
  "yazi-fm"
  "yazi-cli"
)

#######################################
# installs cargo binaries.
#
# debian/ubuntu derivatives take too long to update their packages.
# some binaries are not available in apt.
#######################################
cargo_binaries() {
  if ! (which cargo >/dev/null); then
    # shellcheck disable=SC1091
    source "$HOME/.cargo/env"
  fi

  curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

  for package in "${cargo_crates[@]}"; do
    cargo binstall "$package" -y &
  done
  wait
}

#######################################
# installs neovim version manager
#######################################
bob_nvim() {
  cargo binstall bob-nvim -y
  bob install latest
  bob use latest
}
