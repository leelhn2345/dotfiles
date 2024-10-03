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

# ! completion styling (depracated)
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

# aliases
alias v='nvim'
alias vc='cd ~/.config/nvim && nvim'

alias cdd='cd ~/dotfiles'
alias vd='cd ~/dotfiles && nvim'

alias cat='bat'

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

alias ccf='cargo clippy --fix --allow-dirty --allow-staged && cargo fmt'
alias cai='cargo autoinherit'

alias cc='cargo clippy'
alias cw='cargo watch -c -q -x clippy'
alias ct='cargo nextest run'
alias ctn='cargo nextest run --nocapture'
alias cr='cargo run'
alias cwr='cargo watch -c -q -w src -x run'
alias cwcr='cargo watch -c -q -w src -x clippy -x run'
alias cwt='cargo watch -c -q -x -- cargo nextest run'
alias cwtr='cargo watch -c -q -x clippy -x -- cargo nextest run -x run'
alias clw='cargo leptos watch'

alias rustdoc='rustup doc'
alias rustbook='rustup doc --book'
alias ruststd='rustup doc --std'
alias cu='cargo install-update -a'
# alias cdo="cargo tree --depth 1 -e normal --prefix none | cut -d' ' -f1 | xargs printf -- '-p %s\n' | xargs cargo doc --no-deps --open"
# alias cdo='cargo makedocs --open'
alias cdo='cargo doc --no-deps --open'

alias explorer='explorer.exe `wslpath -w "$PWD"`'
alias k='kubectl'
alias port='netstat -tuln'
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"'

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

eval "$(zoxide init --cmd cd zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# golang
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# zsh
source <(fzf --zsh)

eval "$(direnv hook zsh)"
