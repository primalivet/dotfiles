{ pkgs, ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    casks = [
      # "nikitabobko/tap/aerospace"
      "ghostty@tip"
      "bruno"
      "tailscale"
      "firefox"
    ];
  };
}
