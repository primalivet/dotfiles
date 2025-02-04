inputs@{ pkgs, user, ... }: {

  users.users.${user} =  {
    home = "/Users/${user}";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    inputs.neovim-nightly-overlay.packages.aarch64-darwin.default 
    ripgrep
    curl
    direnv
    fd
    fzf
    git
    jq
    lua-language-server
    nodejs_23
    stow
    tree
    typescript-language-server
    vim
    vscode-langservers-extracted
    zsh-autosuggestions
    zsh-syntax-highlighting
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

  environment.shells = with pkgs; [
    bashInteractive
    zsh
    fish
  ];

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    casks = [
      "rectangle"
      "ghostty@tip"
    ];
  };

  security.pam.enableSudoTouchIdAuth = true;

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
    };

    screencapture.location = "${builtins.getEnv ("HOME")}/Documents/Screenshots";

    finder = {
      AppleShowAllExtensions = true;
      _FXShowPosixPathInTitle = true;
    };

    NSGlobalDomain._HIHideMenuBar = true;

    hitoolbox.AppleFnUsageType = "Change Input Source";
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
