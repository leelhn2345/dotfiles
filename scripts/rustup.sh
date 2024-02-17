#!/usr/bin/env bash

#######################################
# sets up rust, cargo and cargo-binstall
#######################################
rustup_toolchain() {
	curl https://sh.rustup.rs -sSf | sh -s -- -y

	# shellcheck disable=SC1091
	source "$HOME/.cargo/env"

	cargo install cargo-binstall
}

#######################################
# installs cargo binaries.
#
# some binaries are not available via apt.
# debian/ubuntu derivatives take too long to upate their packages.
#######################################
cargo_binaries() {
	cargo binstall ripgrep -y &
	cargo binstall lsd -y &
	cargo binstall zoxide -y &
	cargo binstall cargo-update -y &
	cargo binstall tree-sitter-cli -y &
	cargo binstall cargo-makedocs -y &
	cargo binstall cargo-watch -y &
	cargo binstall cargo-nextest -y &

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
