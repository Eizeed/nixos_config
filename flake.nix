{
    description = "Basic configuration with Home manager config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

 #       hyprland.url = "github:hyprwm/Hyprland";
 #       hyprland-plugins = {
 #           url = "github:hyprwm/hyprland-plugins";
 #           inputs.hyprland.follows = "hyprland";
 #       };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
        nixosConfigurations.liteflow-nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./etc/configuration.nix
                    ./etc/packages.nix

                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.lf_nixos = import ./users/lf_nixos/home.nix;
                        home-manager.extraSpecialArgs = { inherit inputs; };
                    }
            ];
        };
    };
}
