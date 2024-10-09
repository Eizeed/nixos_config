{ pkgs, config, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    wget
    pavucontrol
    wl-clipboard
    man
    fastfetch
#    alacritty
    hsetroot
    vesktop
    spotify
    kitty
    git
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; } )
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
     "spotify"
     "nvidia-x11"
     "nvidia-settings"
    ];
}
