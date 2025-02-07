{
  description = "Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }:
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
    darwinConfigurations.macbook-pro = nix-darwin.lib.darwinSystem {
      inherit pkgs;
      modules = [ 
        (import ./modules/darwin user) 
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = import ./modules/home-manager;
        }
      ];
    };

    devShells.${system} = import ./devshells { 
        inherit pkgs; 
    };
  };
}
