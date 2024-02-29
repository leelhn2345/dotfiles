#!/usr/bin/env bash

#######################################
# installs nala, an apt wrapper
#######################################
install_apt_wrapper() {
	sudo apt-get update -y
	sudo apt-get install nala -y
}

packages=(
	zsh
	build-essential
	htop
	neofetch
	tree
	bat
	jq
	fzf
	fd-find
	libfuse2
	mercurial
	sed
	python3-venv
	stow
	tmux
	vim
	unzip
)

#######################################
# installs system packages
#######################################
install_packages() {
	sudo nala install "${packages[@]}" -y
	wait
}

#######################################
# installs wsl system packages
#
# addition of `wslu`
#######################################
install_wsl_packages() {
	packages+=(wslu ppa-purge)
	sudo nala install "${packages[@]}" -y
	wait
}

#######################################
# symlink packages
#######################################
post_process_packages() {
	mkdir -p ~/.local/bin
	ln -s "$(which fdfind)" ~/.local/bin/fd # symlink to `find`
}
