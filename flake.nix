{
  description = "Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, ... }:
  let
    user = "gustaf";
    system = "aarch64-darwin";

    pkgs = import nixpkgs { 
        inherit system; 
        config.allowUnfree = true; 
        overlays = [
          inputs.neovim-nightly-overlay.overlays.default
        ];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#papabear
    darwinConfigurations.macbook-pro = nix-darwin.lib.darwinSystem {
      inherit pkgs;
      modules = [ 
        (import ./modules/darwin user) 
      ];
    };

    devShells.${system} = import ./devshells { 
        inherit pkgs; 
    };
  };
}
