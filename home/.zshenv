. "$HOME/.cargo/env"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add bob to PATH if it exists
if [ -d "$HOME/.local/share/bob/nvim-bin" ]; then
    PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fi

export FLYCTL_INSTALL="/home/nelson/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export MESA_D3D12_DEFAULT_ADAPTER_NAME=NVIDIA
export HELIX_RUNTIME=$HOME/.config/helix/runtime
