{
  description = "System configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin-linking.url = "github:dwt/nix-darwin/application-linking-done-right";
    nix-darwin-linking.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, ... }:
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
    in
    {
      formatter = {
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
        aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixpkgs-fmt;
      };

      darwinConfigurations.macbook-pro = inputs.nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          { nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ]; }
          ./machines/macbook-pro/configuration.nix
          # Needed for linking GUI apps, will probably be merged soon
          # https://github.com/nix-darwin/nix-darwin/pull/1396
          { disabledModules = [ "system/applications.nix" ]; }
          "${inputs.nix-darwin-linking}/modules/system/applications.nix"
        ];
      };

      nixosConfigurations = {
        vm-aarch64-fusion = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            { nixpkgs.config.allowUnfree = true; }
            { nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ]; }
            ./machines/vm-aarch64-fusion/configuration.nix
          ];
        };

        vm-aarch64-utm = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            { nixpkgs.config.allowUnfree = true; }
            { nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ]; }
            ./machines/vm-aarch64-utm/configuration.nix
          ];
        };

        vm-x86_64-utm = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            { nixpkgs.config.allowUnfree = true; }
            { nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ]; }
            ./machines/vm-x86_64-utm/configuration.nix
          ];
        };
      };

      devShells = {
        aarch64-darwin = mkShell "aarch64-darwin";
        aarch64-linux = mkShell "aarch64-linux";
        x86_64-linux = mkShell "x86_64-linux";
      };
    };
}
