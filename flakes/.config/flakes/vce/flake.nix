{
  description = "VCE configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs@{ self, nixpkgs }: let 
    system = "aarch64-darwin";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        kubectl
        nodejs_22
      ];

      shellHook = ''
        source ~/.zsh_private_vce
      '';
    };
  };
}
