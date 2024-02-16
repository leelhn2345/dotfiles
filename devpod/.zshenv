. "$HOME/.cargo/env"

# add bob to PATH if it exists
if [ -d "/home/root/.local/share/bob/nvim-bin" ]; then
    PATH="/home/root/.local/share/bob/nvim-bin:$PATH"
fi
