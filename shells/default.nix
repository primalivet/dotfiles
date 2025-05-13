{ pkgs }: {
  default = pkgs.mkShell {
    buildInputs = with pkgs; [
      lua-language-server
    ];

    shellHook = ''
    '';
  };

  hb = pkgs.mkShell {
    name = "HB";
    buildInputs = with pkgs; [
      typescript-language-server
      vscode-langservers-extracted
      python3
    ];

    shellHook = ''
      export NPM_CONFIG_USERCONFIG=~/.hb/.npmrc
      source ~/.hb/.zsh_private
    '';
  };

  vce = pkgs.mkShell {
    name = "VCE";
    buildInputs = with pkgs; [
      kubectl
      k9s
      kubelogin
      nodejs_22
      (azure-cli.withExtensions [
        azure-cli.extensions.azure-devops
        azure-cli-extensions.aks-preview
      ])
      postgresql
      typescript-language-server
      vscode-langservers-extracted
      nodePackages."@prisma/language-server"
      tenv
      podman
      podman-compose
      sonar-scanner-cli
    ] ++ [
      (pkgs.writeShellScriptBin "vsu" ''npx @volvo/vce-service-util@latest $@'')
      (pkgs.writeShellScriptBin "hive" ''npx --package=@graphql-hive/cli@0.44.2 hive $@'')
    ];

    shellHook = ''
      export NPM_CONFIG_USERCONFIG=~/.vce/.npmrc
      source ~/.vce/.zsh_private
    '';
  };
}
