{ pkgs, ... }: 
{
  users.users.gustaf = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$6$.TJ/b9UC4jo3TOvz$DqfuGS5oj6O.X/zyHRRP9pjHJ9MbqcOHvfjSZbOFoBgMOE6dBvwXCbdqG0qkX2tC27pFZ0Hzgbics5TH2XDmU/";
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };
}
