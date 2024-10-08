# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];

# Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "liteflow-nixos"; 
    networking.networkmanager.enable = true;  

# Set your time zone.
    time.timeZone = "Asia/Seoul";

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    nix = {
        package = pkgs.nixFlakes;
        extraOptions = ''
            experimental-features = nix-command flakes
            '';
    };


# Nvidia setup
    hardware.graphics = {
        enable = true;
    };

# Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
        modesetting.enable = true;

        powerManagement.enable = false;

        powerManagement.finegrained = false;

        open = false;

        nvidiaSettings = true;

        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

# KDE Plasma setup
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

# KDE Plasma exlcude default packages
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        konsole
            (lib.getBin qttools)
            kate
            khelpcenter
            baloo-widgets
            ffmpegthumbs
            spectacle
    ];

# Zsh as default Shell
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;


# Fonts configuration
    fonts = {
        enableDefaultPackages = true;
        fontconfig = {
            defaultFonts = {
                serif = [];  
                sansSerif = [ "Fira Code" ];
                monospace = [ "Fira Code" ];  
            };
        };
    };

#  programs.hyprland.enable = true;
#  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

# Configure keymap in X11
# services.xserver.xkb.layout = "us";
# services.xserver.xkb.options = "eurosign:e,caps:escape";

# Enable CUPS to print documents.
# services.printing.enable = true;

# Enable sound.
    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.lf_nixos = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # enable ‘sudo’ for the user.
            packages = with pkgs; [
            firefox
                tree
            ];
    };

    users.users.test = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # enable ‘sudo’ for the user.
            packages = with pkgs; [
            firefox
                tree
            ];
    };


# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# Copy the NixOS configuration file and link it from the resulting system
# (/run/current-system/configuration.nix). This is useful in case you
# accidentally delete configuration.nix.
# system.copySystemConfiguration = true;

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
    system.stateVersion = "24.05"; # Did you read the comment?

}

