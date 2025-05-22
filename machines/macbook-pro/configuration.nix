{ pkgs, ... }: {


  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    git
    curl
    neovim
    nodejs_23
    ollama
    stow
    tree
    vim
    jq
    fzf
    direnv
    sops
    age
    # Networking
    inetutils
    nmap
    coreutils
  ];

  environment.shells = with pkgs; [
    bashInteractive
    zsh
    fish
  ];

  programs.zsh.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  imports = [
    ../../modules/darwin-settings.nix
    ../../modules/darwin-homebrew.nix
  ];

  # There seem to have been issues with controling the users shell, these
  # issues are resolved below but require users.knownUsers to be set and
  # include the current ${user}. Like so:
  #
  # users.knownUsers = [ "${user}" ];
  # 
  # The other way to do this is to change shell with assuming zsh and that the
  # nix one is the first in $PATH. chsh -s $(which zsh) 
  #
  # Issues and pull request 
  # https://github.com/LnL7/nix-darwin/issues/328
  # https://github.com/LnL7/nix-darwin/issues/1237
  # https://github.com/LnL7/nix-darwin/pull/1120

  # For some reason the config also has to provide a uid for the user, with the
  # default value, 501.
  # https://github.com/LnL7/nix-darwin/issues/811#issuecomment-2227337970

  users = {
    knownUsers = [ "gustaf" ];
    users.gustaf = {
      uid = 501;
      home = "/Users/gustaf";
      shell = pkgs.zsh;
    };
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
