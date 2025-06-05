{ pkgs, ... }: {
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

  security.pam.services.sudo_local.touchIdAuth = true;

  security.pki.certificateFiles = [
    ../certs/root-ca-homelab.crt
  ];
}

