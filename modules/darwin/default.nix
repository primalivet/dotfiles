inputs@{ pkgs, user, ... }: {

  users.users.${user}.home = "/Users/${user}";
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [];

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

  programs.zsh.enable = true; 

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
