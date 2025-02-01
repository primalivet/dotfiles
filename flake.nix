{
  description = "Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, ... }:
  let
    system = "aarch64-darwin";
    pkgs = import nixpkgs { 
        inherit system; 
        config.allowUnfree = true; 
    };
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        with pkgs; [ 
	  ripgrep
          fd
	  stow
	  vim
          curl
          direnv
          fzf
          git
          jq
          lua-language-server
          inputs.neovim-nightly-overlay.packages.aarch64-darwin.default
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

    devShells.aarch64-darwin.hb = pkgs.mkShell {
      buildInputs = with pkgs; [];

      shellHook = ''
        export NPM_CONFIG_USERCONFIG=~/.hb/.npmrc
        source ~/.hb/.zsh_private
      '';
    };

    devShells.aarch64-darwin.vce = pkgs.mkShell {
      buildInputs = with pkgs; [ 
        kubectl
        nodejs_22
      ];

      shellHook = ''
        export NPM_CONFIG_USERCONFIG=~/.vce/.npmrc
        source ~/.vce/.zsh_private
      '';
    };
  };
}
