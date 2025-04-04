{ pkgs }: {
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
    ];

    shellHook = ''
      export NPM_CONFIG_USERCONFIG=~/.vce/.npmrc
      source ~/.vce/.zsh_private
    '';
  };
}
