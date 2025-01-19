. "$HOME/.cargo/env"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# download dotnet install/binary from internet
# the path given below is the default installer location
export DOTNET_ROOT=/usr/local/share/dotnet
export PATH=$PATH:$DOTNET_ROOT

# export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!{**/.git/*}'"
export FZF_DEFAULT_COMMAND="fd --type file -E .git"
export FZF_DEFAULT_OPTS="
  --cycle
  --bind='ctrl-u:preview-half-page-up'
  --bind='ctrl-d:preview-half-page-down'
"

export EDITOR="nvim"
