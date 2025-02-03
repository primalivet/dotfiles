{ pkgs }: {
  hb = pkgs.mkShell {
    buildInputs = with pkgs; [];

    shellHook = ''
        export NPM_CONFIG_USERCONFIG=~/.hb/.npmrc
        source ~/.hb/.zsh_private
        '';
  };

  vce = pkgs.mkShell {
    buildInputs = with pkgs; [ 
      kubectl
      nodejs_22
    ] ++ [
        (pkgs.writeShellScriptBin "vsu" ''npx @volvo/vce-service-util@latest $@'')
    ];

    shellHook = ''
      export NPM_CONFIG_USERCONFIG=~/.vce/.npmrc
      source ~/.vce/.zsh_private
      '';
  };
}
