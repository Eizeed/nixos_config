{ pkgs, config, ... }:

{  
  programs.alacritty = {
    enable = true;

    extraOptions = ''
      config_file: "./modules/alacritty/alacritty.toml"
    '';
  };
  #home.file.".config/alacritty/alacritty.toml".source = ./dotfiles/alacritty.toml;
}
