{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = inputs@{ self, nixpkgs }: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
  
    nixosConfigurations.vm-x86_64-utm = nixpkgs.lib.nixosSystem {
     system = "x86_64-linux";
     modules = [
       ./configuration.nix
     ];
    };

  };
}
