{ pkgs, ... }: {

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

  users = {
    knownUsers = [ "gustaf" ];
    users.gustaf =  {
      uid = 501; # https://github.com/LnL7/nix-darwin/issues/811#issuecomment-2227337970
      home = "/Users/gustaf";
      shell = pkgs.zsh;
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ ];

  environment.shells = with pkgs; [
    bashInteractive
    zsh
    fish
  ];

  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    casks = [
      "rectangle"
      "ghostty@tip"
      "firefox"
    ];
  };

  security.pam.enableSudoTouchIdAuth = true;

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
    };

    # Probably need to elevate permissions to set this has mac has "protection"
    # for my self into ~/Documents, ~/Downloads etc.
    # screencapture.location = "${builtins.getEnv ("HOME")}/Documents/Screenshots";
    screencapture.location = "~/Screenshots";

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
