#!/usr/bin/env bash

ZSH_COMPLETIONS_DIR="$HOME/.config/zsh/completions"
ZSH_PLUGINS_DIR="$HOME/.config/zsh/plugins"

zsh_setup() {
  chsh -s /bin/zsh

  mkdir -p "$ZSH_COMPLETIONS_DIR"
  mkdir -p "$ZSH_PLUGINS_DIR"
}

zsh_plugins() {
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_PLUGINS_DIR/powerlevel10k"
  git clone https://github.com/Aloxaf/fzf-tab "$ZSH_PLUGINS_DIR/fzf-tab"
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS_DIR/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-history-substring-search.git "$ZSH_PLUGINS_DIR/zsh-history-substring-search"
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$ZSH_PLUGINS_DIR/zsh-you-should-use"
}

zsh_completions() {
  nala --install-completion zsh >"$ZSH_COMPLETIONS_DIR/_nala"
  rustup completions zsh cargo >"$ZSH_COMPLETIONS_DIR/_cargo"
  rustup completions zsh >"$ZSH_COMPLETIONS_DIR/_rustup"
  curl -o "$ZSH_COMPLETIONS_DIR/_golang" https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_golang
  uv generate-shell-completions zsh >"$ZSH_COMPLETIONS_DIR/_uv"
  pip3 completion --zsh >"$ZSH_COMPLETIONS_DIR/_pip3"
  rg --generate complete-zsh >"$ZSH_COMPLETIONS_DIR/_rg"

  rm -rf ~/.zfunc
}
