#!/usr/bin/env bash

TMUX_DIR="$HOME/.config/tmux"

#######################################
# installs tmux package manager
#######################################
tmux_tpm() {
	mkdir -p "$TMUX_DIR"
	git clone https://github.com/tmux-plugins/tpm "$TMUX_DIR/tpm"
}
