# Dotfiles Management

<!--toc:start-->
- [Dotfiles Management](#dotfiles-management)
  - [About](#about)
  - [Apps](#apps)
  - [Setup](#setup)
    - [Home](#home)
    - [Devpod](#devpod)
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

### Home

> [!NOTE]
> To be documented.

### Devpod

To create [all new workspaces with the same customization](https://devpod.sh/docs/developing-in-workspaces/dotfiles-in-a-workspace#for-all-workspaces):

```sh
devpod context set-options \
-o DOTFILES_URL=https://github.com/leelhn2345/dotfiles -o DOTFILES_SCRIPT=scripts/devpod.sh
```

Once workspace is setup, reconnect ssh and customize [p10k theme](https://github.com/romkatv/powerlevel10k)
via prompt.

## License

Do whatever you want license, © Nelson Lee 2024.
