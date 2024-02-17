#!/usr/bin/env bash

if ! cd "scripts" >/dev/null; then
	echo "error changing directory in $(pwd)"
	exit 1
fi

. ./packages.sh
. ./rustup.sh
. ./coding.sh
. ./zsh.sh
. ./utils.sh

export TERM=xterm-256color

title() {
	info "################################################################################"
	info "$1"
	info "################################################################################"
}

main() {
	info "setting up devpod..."

	title "Apt Packages"
	install_apt_wrapper
	install_packages
	post_process_packages
	success "Finished installing Apt packages."

	title "Rustup Toolchain & Bob-nvim"
	rustup_toolchain
	cargo_binaries
	bob_nvim
	success "Finished installing rustup toolchain and bob-nvim."

	title "Coding Tools"
	poetry_install
	bun_install
	"$HOME/.bun/bin/bun" i -g @loopback/cli git-removed-branches
	success "Finished installing coding tools."

	title "Zsh"
	zsh_setup
	zsh_plugins
	zsh_completions
	success "Finished setting up zsh."

	# whitelisting `.env` for telescope.nvim
	echo "!.env" >/.ignore

	title "Stowing"
	cd ../..
	mv dotfiles ~
	cd ~/dotfiles || {
		err "could not \`cd\` into dotfiles"
		exit 1
	}
	stow --adopt devpod
	git checkout -- .
	stow config -t ~/.config
	success "Finished stowing."

	success "Devpod has been setup. You may ssh now."
}

main
