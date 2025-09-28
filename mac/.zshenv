# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add cargo binaries
if [ -d "$HOME/.cargo/bin" ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# add bob-nvim
# if [ -d "$HOME/.local/share/bob/nvim-bin" ]; then
#     PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
# fi

# export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!{**/.git/*}'"
export FZF_DEFAULT_COMMAND="fd --type file -E .git"
export FZF_DEFAULT_OPTS="
  --cycle
  --bind='ctrl-u:preview-half-page-up'
  --bind='ctrl-d:preview-half-page-down'
"

export EDITOR="nvim"

# add foundry & foundry-zksync binaries
if [ -d "$HOME/.foundry/bin" ]; then
    PATH="$PATH:/Users/nelson/.foundry/bin"
fi
