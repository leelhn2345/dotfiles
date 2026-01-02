# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# keybind (emacs)
bindkey -e

# variables
export ZSH_COMPLETIONS_DIR="$HOME/.config/zsh/completions"
export ZSH_PLUGINS_DIR="$HOME/.config/zsh/plugins"
export NIX_DARWIN_FLAKE="$HOME/dotfiles/nix-darwin"
export GPG_TTY=$TTY

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt append_history         # appends history rather than overwriting it
setopt share_history          # share history between shells
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore if command is same as previous
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it

# completions
fpath=($ZSH_COMPLETIONS_DIR $fpath) # tab completion folder

autoload -Uz compinit
compinit

# ! completion styling (deprecated)
# zstyle ':completion:*' menu select                      # arrow key navigation
# bindkey '^[[Z' reverse-menu-complete                    # shift-tab to reverse menu selection
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # insensitive case match
# setopt menu_complete                                    # first tab is first match
# unsetopt beep                                           # disable sound if there's an error

# ! fzf-tab completion styling
# insensitive case matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# misc zsh settings
zle_highlight=('paste:none')  # no highlighting during paste

# zsh hooks
# -------------------------------------------
autoload -Uz add-zsh-hook

function auto_venv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    deactivate
  fi

  local dir="$PWD"
  while [[ "$dir" != "$HOME" ]]; do
    if [[ -f "$dir/.venv/bin/activate" ]]; then
      source "$dir/.venv/bin/activate"
      return
    fi

    dir="${dir:h}" # move up to parent directory
  done
}

# register hooks
add-zsh-hook chpwd auto_venv
# -------------------------------------------

# Edit Command Buffer
# -------------------------------------------
# Open the current command in your $EDITOR (e.g., neovim)
# Press Ctrl+X followed by Ctrl+E to trigger
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
# -------------------------------------------

# aliases
alias v='nvim'
alias vc='cd ~/.config/nvim && nvim'
alias ps='procs'

# alias update='brew update && brew upgrade'
alias update='nix flake update --flake $NIX_DARWIN_FLAKE'
alias nixs='sudo darwin-rebuild switch --flake $NIX_DARWIN_FLAKE'
alias nixd='nix-collect-garbage -d'

alias cdd='cd ~/dotfiles'
alias vd='cd ~/dotfiles && nvim'

alias cat='bat'

alias ls='lsd'
alias ll='lsd -AlF'
alias la='lsd -A'
alias tree='lsd --tree'

alias sz='source ~/.zshrc'

alias ta='tmux attach -t'
alias tn='tmux new-session -s'
alias tns='tmux new-session'
alias tls='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias ccf='cargo clippy --fix --allow-dirty --allow-staged && cargo fmt'
alias cai='cargo autoinherit'

alias cc='cargo clippy'
alias cw='watchexec -e rs -c -q -r cargo clippy'
alias ct='cargo nextest run'
alias ctn='cargo nextest run --nocapture'
alias cr='cargo run'
alias cwr='watchexec -e rs -c -q -r cargo run'
# alias cwcr='cargo watch -c -q -w src -x clippy -x run'
alias cwt='watchexec -e rs -c -q -r cargo nextest run'
# alias cwtr='cargo watch -c -q -x clippy -x -- cargo nextest run -x run'
alias clw='cargo leptos watch'

alias rustdoc='rustup doc'
alias rustbook='rustup doc --book'
alias ruststd='rustup doc --std'
alias cu='cargo install-update -a'
# alias cdo="cargo tree --depth 1 -e normal --prefix none | cut -d' ' -f1 | xargs printf -- '-p %s\n' | xargs cargo doc --no-deps --open"
# alias cdo='cargo makedocs --open'
alias cdo='cargo doc --no-deps --open'

alias explorer='explorer.exe `wslpath -w "$PWD"`'
alias kc='kubectl'
alias port='netstat -tuln'
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"'
alias du='dust'
alias jq='jaq'
alias jl='jless'
alias tf='terraform'

# fzf aliases
alias fzf="fzf --preview 'bat --style=numbers --color=always {}'"
alias vf='nvim $(fzf --preview="bat --color=always {}")'

alias cl='claude'

alias azs='az account set --subscription $AZ_SUBSCRIPTION'

# theme/plugins
source "$ZSH_PLUGINS_DIR/powerlevel10k/powerlevel10k.zsh-theme"
source "$ZSH_PLUGINS_DIR/fzf-tab/fzf-tab.plugin.zsh"
source "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZSH_PLUGINS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "$ZSH_PLUGINS_DIR/zsh-you-should-use/you-should-use.plugin.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history substring search keybinds
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# shell integrations
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
