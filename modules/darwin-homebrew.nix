{ pkgs, ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    casks = [
      "rectangle"
      "ghostty@tip"
      "google-drive"
      "google-chrome"
      "zed"
      "cursor"
      "bruno"
      "docker"
    ];
  };
}
