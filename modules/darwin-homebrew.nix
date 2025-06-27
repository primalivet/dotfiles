{ pkgs, ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    casks = [
      "rectangle"
      "ghostty@tip"
      "bruno"
      "tailscale"
    ];
  };
}
