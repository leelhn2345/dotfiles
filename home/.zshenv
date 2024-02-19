. "$HOME/.cargo/env"

# add bob to PATH if it exists
if [ -d "$HOME/.local/share/bob/nvim-bin" ]; then
    PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fi

export MESA_D3D12_DEFAULT_ADAPTER_NAME=NVIDIA
export HELIX_RUNTIME=$HOME/.config/helix/runtime
