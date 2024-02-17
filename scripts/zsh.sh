#!/usr/bin/env bash

ZSH_COMPLETIONS_FOLDER="$HOME/.config/zsh/completions"
ZSH_PLUGINS_FOLDER="$HOME/.config/zsh/plugins"

zsh_setup() {
	chsh -s /bin/zsh

	mkdir -p "$ZSH_COMPLETIONS_FOLDER"
	mkdir -p "$ZSH_PLUGINS_FOLDER"
}

zsh_plugins() {
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_PLUGINS_FOLDER/powerlevel10k"
	git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS_FOLDER/zsh-autosuggestions"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGINS_FOLDER/zsh-syntax-highlighting"
	git clone https://github.com/zsh-users/zsh-history-substring-search.git "$ZSH_PLUGINS_FOLDER/zsh-history-substring-search"
	git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$ZSH_PLUGINS_FOLDER/zsh-you-should-use"
}

zsh_completions() {
	rustup completions zsh cargo >"$ZSH_COMPLETIONS_FOLDER/_cargo"
	rustup completions zsh >"$ZSH_COMPLETIONS_FOLDER/_rustup"
	"$HOME/.local/bin/poetry" completions zsh >"$ZSH_COMPLETIONS_FOLDER/_poetry"
}
