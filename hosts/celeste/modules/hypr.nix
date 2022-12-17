{ pkgs, ... }:

with builtins;

{

  home.packages = with pkgs; [
    lxappearance
    hyprpaper
  ];

  wayland.windowManager.hyprland.extraConfig = builtins.readFile ../configs/hypr/hyprland.conf;

  xdg.configFile."hypr/hyprpaper.conf" = {
    source = ../configs/hypr/hyprpaper.conf;
  };
}
