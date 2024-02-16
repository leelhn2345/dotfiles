# Neovim Config

Neovim configs to be shared amongst my computers.

This README is not meant to be a guide or any sorts,
but mostly for my own references.

Uses lazy.nvim as a plugin manager.

## Pre-requisites

I am using Ubuntu/WSL2 so steps may vary from your OS.

### System Dependencies

```sh
# for telescope grep
cargo binstall ripgrep 
sudo nala install libfuse2 -y
sudo nala install fd-find -y 
ln -s $(which fdfind) ~/.local/bin/fd # symlink to `find`

# for tree-sitter
cargo binstall tree-sitter-cli 

# optional 
# run `prettierd stop` to stop daemon process(es)
# to prevent significant memory usage
bun i -g @fsouza/prettierd 

# for diff viewer
sudo nala install mercurial -y

# for spectre
sudo nala install sed -y

# whitelist `.env` for `ripgrep` and `fd-find`
# `.ignore` takes precedence over `.gitignore`
echo "\!.env" > ~/.ignore
```

### Neovim Installation

Install [bob](https://github.com/MordechaiHadad/bob) - neovim version manager.

```sh
cargo binstall bob-nvim
bob install latest

# Add ~/.local/share/bob/nvim-bin to $PATH
nvim -v 

nvim $FILENAME
```

## Features

### Tmux

This setup works with tmux as well.
This is my [.tmux.conf](https://gist.github.com/leelhn2345/ae8792433f073341f6f80f85b7f9983b)
config file.
Just place it at `$HOME`.

### Keymaps

The core keymaps are located in `lua/config/keymaps.lua`.

For keymaps of plugins, they are usually located in the plugin file itself.

Can use telescope to find the key mappings - `<leader>fK`.

### Languages

- python
- nodeJS
- rust

LSPs, formatters, linters and debuggers should be installed and work right out
of the box.
