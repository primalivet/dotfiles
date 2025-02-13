{
  description = "System configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }: let
    mkDevShell = system: 
      let 
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
        };
      in import ./devshells { inherit pkgs; };

    mkSystem = name: { system, user, darwin ? false }: 
      let 
        machineConfiguration = ./modules/${name}/configuration.nix;
        systemFunc = if darwin 
          then inputs.nix-darwin.lib.darwinSystem 
        else nixpkgs.lib.nixosSystem;
      in systemFunc {
          inherit system;
          modules = [
            { nixpkgs.config.allowUnfree = true; }
            { nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ]; }
            machineConfiguration
            (if darwin
              then home-manager.darwinModules.home-manager
            else home-manager.nixosModules.home-manager)
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.${user} = import ./users/${user}/home.nix;
            }
          ];
        };
  in
  {
    darwinConfigurations.macbook-pro = mkSystem "macbook-pro" {
            system = "aarch64-darwin";
            user = "gustaf";
            darwin = true;
    };

    nixosConfigurations.vm-aarch64-utm = mkSystem "vm-aarch64-utm" {
            system = "aarch64-linux";
            user = "gustaf";
    };

    devShells = {
      aarch64-darwin = mkDevShell "aarch64-darwin";
      aarch64-linux = mkDevShell "aarch64-linux";
    };
  };
}
