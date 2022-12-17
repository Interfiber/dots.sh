{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules
  ];
  home.username = "interfiber";
  home.homeDirectory = "/home/interfiber";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}
