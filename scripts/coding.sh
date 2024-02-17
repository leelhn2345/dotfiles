#!/usr/bin/env bash

#######################################
# installs poetry, a python package manager
#######################################
poetry_install() {
	curl -sSL https://install.python-poetry.org | python3 -
}

#######################################
# installs bun, a nodeJS and npm alternative
#######################################
bun_install() {
	curl -fsSL https://bun.sh/install | bash
	SHELL=/bin/zsh "$HOME/.bun/bin/bun" completions >~/.bun/_bun
}
