{
  description = "Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, neovim-nightly-overlay, ... }:
  let
    system = "aarch64-darwin";
    pkgs = import nixpkgs { 
        inherit system; 
        config.allowUnfree = true; 
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#papabear
    darwinConfigurations."papabear" = nix-darwin.lib.darwinSystem {
      modules = [ 
        (import ./modules/darwin { 
          inherit pkgs neovim-nightly-overlay;
        }) 
      ];
    };

    devShells.${system} = import ./devshells { 
        inherit pkgs; 
    };
  };
}
