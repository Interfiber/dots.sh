{
  pkgs,
  lib,
  ...
}:
with lib; let
  swwwPkg = pkgs.callPackage ../../../pkgs/swww.nix {};
in {
  home.packages = [
    swwwPkg
  ];

  wayland.windowManager.hyprland.extraConfig = builtins.readFile ../configs/hypr/hyprland.conf;
}
