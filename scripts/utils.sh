#!/usr/bin/env bash

reset_color=$(tput sgr 0)

#######################################
# logging - info
#######################################
info() {
	printf "%s[*] %s%s\n" "$(tput setaf 4)" "$1" "$reset_color"
}

#######################################
# logging - success
#######################################
success() {
	printf "%s[*] %s%s\n" "$(tput setaf 2)" "$1" "$reset_color"
}

#######################################
# logging - error
#######################################
err() {
	printf "%s[*] %s%s\n" "$(tput setaf 1)" "$1" "$reset_color"
}

#######################################
# logging - warn
#######################################
warn() {
	printf "%s[*] %s%s\n" "$(tput setaf 3)" "$1" "$reset_color"
}
