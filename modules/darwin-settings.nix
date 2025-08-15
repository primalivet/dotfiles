{ pkgs, ... }: {
  system.defaults = {
    NSGlobalDomain."com.apple.keyboard.fnState" = false; # Use F1, F2, etc. keys as standard function keys. Type: null or boolean Default: null
    NSGlobalDomain."com.apple.swipescrolldirection" = false; # Natural scrolling
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.AppleShowAllFiles = true;
    NSGlobalDomain.InitialKeyRepeat = 15;
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
    NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;
    NSGlobalDomain._HIHideMenuBar = false;
    NSGlobalDomain.NSAutomaticWindowAnimationsEnabled = false;

    WindowManager.EnableTilingByEdgeDrag = false;
    WindowManager.EnableTilingOptionAccelerator = false;
    WindowManager.EnableTopTilingByEdgeDrag = false;

    controlcenter.BatteryShowPercentage = true; # Show battery percentage in menubar
    controlcenter.Bluetooth = true; # Show bluetooth in menubar
    controlcenter.Sound = true; # Show sound in menubar

    dock.autohide = true;
    dock.mru-spaces = false; # Rearrange spaces by most recent use
    dock.show-recents = false;

    finder.AppleShowAllExtensions = true;
    finder.CreateDesktop = false; # Hide desktop icons
    finder.FXPreferredViewStyle = "Nlsv";
    finder.ShowExternalHardDrivesOnDesktop = false;
    finder.ShowHardDrivesOnDesktop = false;
    finder.ShowMountedServersOnDesktop = false;
    finder.ShowPathbar = true;
    finder._FXShowPosixPathInTitle = true;

    hitoolbox.AppleFnUsageType = "Change Input Source";

    screencapture.location = "~/Screenshots";

    spaces.spans-displays = true; # one space spans all displays

  };

  system.startup = {
    chime = false;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  security.pki.certificateFiles = [
    ../certs/root-ca-homelab.crt
  ];
}

