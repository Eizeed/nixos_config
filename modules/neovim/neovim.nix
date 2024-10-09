{ pkgs, config, ... }:

{
  programs.neovim = {
    enable = true;
    
    extraPackages = [
      pkgs.wl-clipboard
    ];
  };
}
