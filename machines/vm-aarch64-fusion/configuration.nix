{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.package = pkgs.nixVersions.latest;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  time.timeZone = "Europe/Stockholm";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocales = [ "sv_SE.UTF-8/UTF-8" ];

  fonts.packages = with pkgs; [
    terminus_font_ttf
    proggyfonts
  ];

  hardware.graphics.enable = true;
  virtualisation.vmware.guest.enable = true;

  security.rtkit.enable = true; 

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  users.users.gustaf = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "realtime" ];
    hashedPassword = "$6$OWAIYB4NAWgGyXXg$/IJsv3w4kNOq9Py2O9ZEQgk4q3.yUubYLDuon58ONS7mH4JmpoSWw8L668wVSEhV0QuMwSkPFir9Vyeor3V0Y.";
    shell = pkgs.bash;
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.sway.enable = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    foot
    fzf
    gcc
    git
    gnumake
    grim # grab image from wl compositor
    i3status
    inxi # system information tool
    libnotify
    mako # notification deamon
    mesa-demos # demos and tests for Mesa/OpenGL
    mpv # video player
    nautilus
    neovim
    pixman # pixel manipulation lib, used for software rendering
    slurp # select region from wl compositor
    st
    stow
    swayimg # image viewer
    tmux
    tree
    vim 
    wf-recorder # screen recoding for wl compositor
    wget
    wl-clipboard
  ];

  networking.firewall.enable = false;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

