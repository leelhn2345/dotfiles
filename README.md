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

- Automated installation of all the packages and apps I use
- Setup all my preferred configurations
- stows all my config files

## Apps

- shell: zsh
- editor: [neovim](./config/nvim/README.md)
  - plugings are configured for neovim 0.10
- environments:
    1. WSL2
    2. devpod

**Font used** is [Monaspace Neon](https://monaspace.githubnext.com/).
Nerd font variant is `MonaspiceNe Nerd Font`.

Remember to switch on ligatures.

## Setup

### Home

> [!NOTE]
> Be around to enter password during initial `apt update` and changing of shells.

```sh
git clone https://github.com/leelhn2345/dotfiles ~/dotfiles
cd ~/dotfiles/scripts
source setup_home.sh
```

afterwards, to log in into github

```sh
gh auth login
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

> [!IMPORTANT]
> Repository must contain `.devcontainer/devcontainer.json`!

```sh
# using debian base img
devpod up <workspace-git-url> --ide none --devcontainer-image mcr.microsoft.com/devcontainers/base:debian
```

## License

Do whatever you want license, © Nelson Lee 2024.
