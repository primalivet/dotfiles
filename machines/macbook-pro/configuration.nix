{ pkgs, ... }: {


  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ coreutils ];

  environment.shells = with pkgs; [
    bashInteractive
    zsh
    fish
  ];

  programs.zsh.enable = true;

  security.pam.services.sudo_local.touchIdAuth = true;

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
