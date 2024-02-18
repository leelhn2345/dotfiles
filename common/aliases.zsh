alias v='nvim'
alias vc='cd ~/.config/nvim && nvim'
alias vim='nvim'

alias cdd='cd ~/dotfiles'
alias vd='cd ~/dotfiles && nvim'

alias cat='batcat'

alias ls='lsd'
alias ll='lsd -alF'
alias la='lsd -a'
alias tree='lsd --tree'

alias sz='source ~/.zshrc'

alias ta='tmux attach -t'
alias tn='tmux new-session -s'
alias tns='tmux new-session'
alias tls='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias cpf='cargo clippy --fix --allow-dirty --allow-staged'

alias cc='cargo clippy'
alias cw='cargo watch -c -q'
alias cwc='cargo watch -c -q -x clippy'
alias ct='cargo nextest run'
alias cwr='cargo watch -c -q -w src -x run'
alias cwcr='cargo watch -c -q -w src -x clippy -x run'
alias cwt='cargo watch -c -q -x -- cargo nextest run'
alias cwtr='cargo watch -c -q -x clippy -x -- cargo nextest run -x run'
alias clw='cargo leptos watch'

alias rustdoc='rustup doc'
alias rustbook='rustup doc --book'
alias ruststd='rustup doc --std'
# alias cdo="cargo tree --depth 1 -e normal --prefix none | cut -d' ' -f1 | xargs printf -- '-p %s\n' | xargs cargo doc --no-deps --open"
alias cu='cargo install-update -a'
alias cdo='cargo makedocs --open'

alias update='sudo nala update && sudo nala upgrade -y'
alias autoremove='sudo nala autoremove -y'
alias autopurge='sudo nala autopurge -y'

