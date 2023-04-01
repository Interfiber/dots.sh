{
  description = "Home manager config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
    hostname = "celeste";
    lib = nixpkgs.lib;
  in {
    homeConfigurations.${hostname} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        hyprland.homeManagerModules.default

        {
          wayland.windowManager.hyprland = {
            enable = true;
            xwayland = {
              enable = true;
              hidpi = true;
            };
            nvidiaPatches = false;
          };
        }
        ./hosts/celeste/user/home.nix
      ];
    };
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/celeste/system/configuration.nix
      ];
    };
    apps.${system} = {
      "activate/${hostname}" = let
        drv = self.outputs.homeConfigurations.${hostname}.activationPackage;
        exePath = "/activate";
      in {
        type = "app";
        program = "${drv}${exePath}";
      };
    };
  };
}
