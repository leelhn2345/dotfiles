#!/usr/bin/env bash

#######################################
# installs poetry, a python package manager
#######################################
poetry() {
	curl -sSL https://install.python-poetry.org | python3 -
}
