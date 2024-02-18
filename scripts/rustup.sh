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

cargo_crates=(
	"ripgrep"
	"lsd"
	"zoxide"
	"cargo-update"
	"tree-sitter-cli"
	"cargo-makedocs"
	"cargo-watch"
	"cargo-nextest"
)

#######################################
# installs cargo binaries.
#
# debian/ubuntu derivatives take too long to update their packages.
# some binaries are not available in apt.
#######################################
cargo_binaries() {
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
