# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

fpath=(~/.config/zsh/completions $fpath) # tab completion folder (line manually added)

autoload -Uz compinit
compinit
# End of lines added by compinstall

# misc zsh settings
zle_highlight=('paste:none')
zstyle ':completion:*' menu select
setopt menu_complete # first tab is first match
unsetopt beep
bindkey '^[[Z' reverse-menu-complete # shift-tab to reverse menu selection
bindkey '^H' backward-kill-word # enables ctrl+del for deleting till left word break

## history command configuration
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share history between shells

# aliases
alias v='nvim'
alias vc='cd ~/.config/nvim && nvim'

alias vmp='source $HOME/.local/share/nvim/mason/packages/mypy/venv/bin/activate'

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

# theme/plugins
ZSH_PLUGINS_DIR="$HOME/.config/zsh/plugins"

source "$ZSH_PLUGINS_DIR/powerlevel10k/powerlevel10k.zsh-theme"
source "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZSH_PLUGINS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "$ZSH_PLUGINS_DIR/zsh-you-should-use/you-should-use.plugin.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history substring search options
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

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

# ros settings
#source /opt/ros/foxy/setup.zsh
#source /usr/share/colcon_cd/function/colcon_cd.sh
#source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh
#alias ri='rosdep install -i --from-path src --rosdistro ${ROS_DISTRO} -y'
