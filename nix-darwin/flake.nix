{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      mac-app-util,
      nix-homebrew,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          homebrew = {
            brews = [
              "sevenzip"
              {
                name = "libpq";
                link = true;
              }
              "gpg2"
            ];
            taps = [
              "th-ch/youtube-music"
            ];
            casks = [
              "wezterm"
              "obsidian"
              "youtube-music"
            ];
            enable = true;
            onActivation = {
              autoUpdate = true;
              cleanup = "zap";
              upgrade = true;
            };
          };

          # allows for non-open-sourced programs to be downloaded
          nixpkgs.config.allowUnfree = true;

          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = with pkgs; [
            lld
            curl
            htop
            neovim
            neofetch
            bat
            fd
            fzf
            mercurial
            stow
            fswatch
            pkgconf
            gh
            glab
            direnv
            tmux
            poppler
            imagemagick
            ripgrep
            yazi
            delta
            jaq
            lsd
            zoxide
            azure-cli

            # coding
            nil
            nixfmt-rfc-style
            fnm
            pnpm
            uv
            rustup
            go
            dotnet-sdk
            typst
          ];

          environment.variables = {
            DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
          };

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          # programs.fish.enable = true;
          programs.zsh.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#mac
      darwinConfigurations."mac" = inputs.nix-darwin.lib.darwinSystem {
        modules = [
          mac-app-util.darwinModules.default
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "nelson";

              # Automatically migrate existing Homebrew installations
              autoMigrate = true;
            };
          }
          configuration
        ];
      };
    };
}
