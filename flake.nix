{
  description = "Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        with pkgs; [ 
	  ripgrep
	  stow
	  vim
          curl
          direnv
          fzf
          git
          jq
          lua-language-server
          neovim
          nodejs_23
          tree
          typescript-language-server
          vscode-langservers-extracted
        ];

      homebrew = {
          enable = true;
          onActivation.cleanup = "zap";
          casks = [
            "rectangle"
            "ghostty@tip"
          ];
      };

      security.pam.enableSudoTouchIdAuth = true;

      system.defaults = {
          dock = {
            autohide = true;
            show-recents = false;
          };

          screencapture.location = "${builtins.getEnv ("HOME")}/Documents/Screenshots";

          finder = {
            AppleShowAllExtensions = true;
            _FXShowPosixPathInTitle = true;
          };

          NSGlobalDomain._HIHideMenuBar = true;

          hitoolbox.AppleFnUsageType = "Change Input Source";
      };

      programs.zsh.enable = true; 

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#papabear
    darwinConfigurations."papabear" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
