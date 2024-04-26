#!/usr/bin/env bash

. ./packages.sh
. ./rustup.sh
. ./coding.sh
. ./zsh.sh
. ./tmux.sh
. ./logging.sh

main() {
	info "setting up ubuntu(wsl) terminal environment..."

	title "Apt Packages"
	install_apt_wrapper
	install_wsl_packages
	post_process_packages
	success "Finished installing apt packages."

	title "Rustup Toolchain & Bob-nvim"
	rustup_toolchain
	cargo_binaries
	bob_nvim
	success "Finished installing rustup toolchain and bob-nvim."

	title "Coding Tools"
	poetry_install
	nvm_install
	bun_install
	golang_install
	success "Finished installing coding tools."

	title "Zsh & tmux"
	zsh_setup
	zsh_plugins
	zsh_completions
	tmux_tpm
	success "Finished setting up zsh & tmux."

	# whitelisting `.env` for ripgrep and fd-find
	echo "!.env" >~/.ignore
	echo "!fly.toml" >~/.ignore

	title "Stowing"
	cd ..
	stow --adopt common
	stow --adopt home
	git checkout -- .
	stow config -t ~/.config
	success "Finished stowing."

	success "Finished setting up. Please restart terminal."
}

main
