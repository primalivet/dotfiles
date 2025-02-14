{ pkgs, ... }: 
{
  users.users.gustaf = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$6$.TJ/b9UC4jo3TOvz$DqfuGS5oj6O.X/zyHRRP9pjHJ9MbqcOHvfjSZbOFoBgMOE6dBvwXCbdqG0qkX2tC27pFZ0Hzgbics5TH2XDmU/";
    packages = with pkgs; [
      tree
      gcc
      xclip
      # ghostty requires OpenGL 3.3, which UTM 4.x unfortunately does not support (yet?)
      # workaround: use `LIBGL_ALWAYS_SOFTWARE=true ghostty` alias
      # refs:
      #   https://github.com/ghostty-org/ghostty/discussions/2602
      #   https://github.com/utmapp/UTM/issues/4285
      #   https://docs.mesa3d.org/envvars.html#envvar-LIBGL_ALWAYS_SOFTWARE
      # alias ghostty="LIBGL_ALWAYS_SOFTWARE=true ghostty"
      ghostty
    ];
    shell = pkgs.zsh;
  };
}
