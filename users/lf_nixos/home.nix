{ pkgs, config, inputs, ... }:
{
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
        gcc
        cargo
  ];

  # Zsh config
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
        export EDITOR=nvim
	    source ~/.config/nixos/users/lf_nixos/dotfiles/p10k.zsh
    '';

    shellAliases = {
      ll = "ls -l";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

   # Zsh plugins with Zplug
    zplug = {
      enable = true;
      plugins = [
        { name = "git/git"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };
  };
#  home.file.".p10k.zsh".source = ./dotfiles/p10k.zsh;


 # Alacritty config
#  programs.alacritty = {
#    enable = false;
#  };
  
 # home.file.".config/alacritty/alacritty.toml".source = ./dotfiles/alacritty.toml;
   
    # Hyprland setup
#    wayland.windowManager.hyprland = {
#        enable = true;
#
#        plugins = [
#            inputs.hyprland-plugins.packages."${pkgs.stdenv.hostPlatform.system}".hyprbars
#        ];
#
#        settings = {
#            
#        };
#    };

  
 # Kitty config
  programs.kitty = {
    enable = true;

    font = {
        name = "Fira Code";
        size = 14;
    };

    shellIntegration.enableZshIntegration = true;

    extraConfig = ''
    confirm_os_window_close 0
    background_opacity 1
    background_image /home/lf_nixos/Downloads/22.png
    background_image_layout cscaled
    '';
  };


 # Neovim config
 programs.neovim = {
   enable = true;

   extraPackages = [
     pkgs.wl-clipboard
     pkgs.python3
     pkgs.python3Packages.pynvim
     pkgs.luaPackages.luarocks
     pkgs.lua5_1
     pkgs.lua-language-server
     pkgs.vimPlugins.lazy-nvim
     pkgs.rust-analyzer
   ];
 };
 home.file.".config/nvim".source = ./nvim_config;

  
 # Git config
  programs.git = {
    enable = true;
    userName = "Eizeed";
    userEmail = "eizeed321@gmail.com";
  };


}
