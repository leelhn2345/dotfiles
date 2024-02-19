#!/usr/bin/env bash

#######################################
# installs poetry, a python package manager
#######################################
poetry_install() {
	curl -sSL https://install.python-poetry.org | python3 -
}

#######################################
# installs nvm - node version manager
#######################################
nvm_install() {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
	# shellcheck disable=SC1090
	source ~/.nvm/nvm.sh
	nvm install --lts
}

#######################################
# installs bun, a nodeJS and npm alternative
#######################################
bun_install() {
	curl -fsSL https://bun.sh/install | bash
	SHELL=/bin/zsh "$HOME/.bun/bin/bun" completions >~/.bun/_bun
}

#######################################
# golang version manager - https://github.com/go-nv/goenv
#
# uses `goenv` as cmd
#######################################
golang_install() {
	git clone https://github.com/go-nv/goenv.git ~/.goenv

	export GOENV_ROOT="$HOME/.goenv"
	export PATH="$GOENV_ROOT/bin:$PATH"
	eval "$(goenv init -)"
	export PATH="$GOROOT/bin:$PATH"
	export PATH="$PATH:$GOPATH/bin"

	goenv install latest
	LATEST_GOLANG_VERSION=$(goenv versions | awk '{print $1}')
	info "installed latest golang version -- $LATEST_GOLANG_VERSION"
	goenv global "$LATEST_GOLANG_VERSION"
}
