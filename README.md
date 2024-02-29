# Dotfiles Management

<!--toc:start-->
- [Dotfiles Management](#dotfiles-management)
  - [About](#about)
  - [Apps](#apps)
  - [Setup](#setup)
    - [Home](#home)
    - [Devpod](#devpod)
      - [Overriding devcontainer image](#overriding-devcontainer-image)
  - [License](#license)
<!--toc:end-->

## About

Dotfiles to set up various development environments.

Summary:

- Installs all the packages and apps I use
- Setup all my preferred configurations
- stows all my config files

## Apps

- shell: zsh
- editor: neovim
- environments:
    1. WSL2
    2. devpod

## Setup

**Fonts used** is [Monaspace Neon](https://monaspace.githubnext.com/)
& `MonaspiceNe Nerd Font`. Remember to switch on ligatures.

### Home

> [!WARNING]
> Bun installation failed for some reason.

```sh
git clone https://github.com/leelhn2345/dotfiles ~/dotfiles
cd ~/dotfiles/scripts
source setup_home.sh
```

### Devpod

To create [all new workspaces with the same customization](https://devpod.sh/docs/developing-in-workspaces/dotfiles-in-a-workspace#for-all-workspaces):

```sh
# script is for `image: mcr.microsoft.com/devcontainers/base:debian`
devpod context set-options \
-o DOTFILES_URL=https://github.com/leelhn2345/dotfiles -o DOTFILES_SCRIPT=scripts/setup_devpod.sh
```

Once workspace is setup, ssh into pod and then customize [p10k theme](https://github.com/romkatv/powerlevel10k)
via prompt.

#### Overriding devcontainer image

To override the image configured in workspace's `devcontainer.json`, setup workspace
with `--devcontainer-image <image>` flag:

```sh
devpod up <workspace-git-url> --ide none --devcontainer-image mcr.microsoft.com/devcontainers/base:debian
```

## License

Do whatever you want license, © Nelson Lee 2024.
