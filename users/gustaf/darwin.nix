{ pkgs, ... }: 

{
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
    users.gustaf =  {
      uid = 501; 
      home = "/Users/gustaf";
      shell = pkgs.zsh;
    };
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    casks = [
      "rectangle"
      "ghostty@tip"
      "firefox"
      "zed"
    ];
  };
}
