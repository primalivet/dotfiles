{ config, lib, pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    ripgrep
    fd
    stow
    vim
    curl
    direnv
    fzf
    git
    jq
    lua-language-server
    nodejs_23
    tree
    typescript-language-server
    vscode-langservers-extracted
      inputs.neovim-nightly-overlay.packages.aarch64-darwin.default
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

}
