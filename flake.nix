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

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }:
    let
      mkShell = system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
          };
        in
        import ./shells { inherit pkgs; };

      mkUserSystem = name: { system, darwin ? false }:
        let
          machineConfiguration = ./machines/${name}/configuration.nix;
          systemFunc =
            if darwin
            then inputs.nix-darwin.lib.darwinSystem
            else nixpkgs.lib.nixosSystem;
        in
        systemFunc {
          inherit system;
          modules = [
            { nixpkgs.config.allowUnfree = true; }
            { nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ]; }
            machineConfiguration
          ];
        };
    in
    {
      formatter = {
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
      };


      darwinConfigurations.macbook-pro = mkUserSystem "macbook-pro" {
        system = "aarch64-darwin";
        darwin = true;
      };

      nixosConfigurations.vm-aarch64-utm = mkUserSystem "vm-aarch64-utm" {
        system = "aarch64-linux";
      };

      devShells = {
        aarch64-darwin = mkShell "aarch64-darwin";
        aarch64-linux = mkShell "aarch64-linux";
      };
    };
}
