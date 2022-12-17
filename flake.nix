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
      # build with your own instance of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true;}; # in the future remove discord
    };
    hostname = "celeste";
    lib = nixpkgs.lib;
  in {
    homeConfigurations.${hostname} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        hyprland.homeManagerModules.default
        {wayland.windowManager.hyprland.enable = true;}
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
