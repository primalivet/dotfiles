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

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, neovim-nightly-overlay, ... }:
  let
    host = "papabear";
    user = "gustaf";
    userPath = "/Users/${user}";
    system = "aarch64-darwin";
    pkgs = import nixpkgs { 
        inherit system; 
        config.allowUnfree = true; 
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#papabear
    darwinConfigurations.${host} = nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [ 
        (import ./modules/darwin { 
          inherit pkgs neovim-nightly-overlay;
        }) 
        home-manager.darwinModules.home-manager
        {
          users.users.${user}.home = userPath;
          home-manager.useGlobalPkgs = true;           
          home-manager.useUserPackages = true;
          home-manager.users.gustaf = import ./modules/home-manager;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };

    devShells.${system} = import ./devshells { 
        inherit pkgs; 
    };
  };
}
