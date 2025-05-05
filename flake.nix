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

      mkHomelabSystem = name: { system, user }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit user name; };
          modules = [
            ./machines/${name}/configuration.nix
            ./users/${user}/homelab.nix
            ];
        };

      mkUserSystem = name: { system, user, darwin ? false }:
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
            (if darwin then ./users/${user}/darwin.nix else ./users/${user}/nixos.nix)
            (if darwin
            then home-manager.darwinModules.home-manager
            else home-manager.nixosModules.home-manager)
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.${user} = import ./users/${user}/home-manager.nix;
              home-manager.extraSpecialArgs = { darwin = darwin; };
            }
          ];
        };
    in
    {
      formatter = {
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
      };


      darwinConfigurations.macbook-pro = mkUserSystem "macbook-pro" {
        system = "aarch64-darwin";
        user = "gustaf";
        darwin = true;
      };

      nixosConfigurations.vm-aarch64-utm = mkUserSystem "vm-aarch64-utm" {
        system = "aarch64-linux";
        user = "gustaf";
      };

      nixosConfigurations.homelab1 = mkHomelabSystem "homelab1" {
        system = "aarch64-linux";
        user = "gustaf";
      };

      nixosConfigurations.iso-aarch64 = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          (nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
          {
            nix.settings.experimental-features = ["nix-command" "flakes"];
            security.sudo.wheelNeedsPassword = false;
            services.openssh.enable = true;
            users.users.nixos = {
              isNormalUser = true;
              extraGroups = ["wheel"];
              openssh.authorizedKeys.keys = [
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDp7yzlnHtcS7TliFQcaHKiojr6frzHsZ62F5kp62eeE0mmACB4vnwvWF+z6jusZpqZ1vNej5Sjh6O1phj4igtTQ5OV+D9imbhBmFvGfP9hvaIvWgdqBipeJ454u9G8n7rx9rgiPekzJfNuCpjRqJrDdc8upQJfTZTVzuDjA3yPg4rVq9L4wJWBZUzukzDEKRjrkmXE6Cuwa5xUhpViedz49+IIQypSXT/v3REnrsCO0qNm45kXhEMFH9qv12HS56jZW6ndx+OJjfhXyab8UChivFiAt/QpF3bdhtRCJ74M0bAFSsAb3UhGJ/37mslatZUH0NQpQdzIrWpzIYUFMAmKPN0pyOEzo7IVMlSdD9Tm8DkpeXPv8qDF/CBo6ms7FpDqPKm+J2kH9V7lo88Jm0FjFLYBGXcTv4a92o+nkYAB0Ga/thhbqL/Q2Zmjf+0X8S2QL5v7hey9HmVNV60hAn0merFesg2BX7oVp7QxyvUy8Vj1GnB41Ph2BSFvLhShpW8= gustaf@Gustafs-MacBook-Pro.local"
              ];
            };
            # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
            system.stateVersion = "24.11"; # Did you read the comment?
          }
        ];
      };

      devShells = {
        aarch64-darwin = mkShell "aarch64-darwin";
        aarch64-linux = mkShell "aarch64-linux";
      };
    };
}
