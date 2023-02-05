{
  pkgs,
  lib,
  ...
}:
with builtins; {
  home.packages = with pkgs; [
    pkgs.rofi-wayland
  ];

  programs.rofi = {
    theme = ../configs/rofi/theme.rasi;
  };

  xdg.configFile."rofi/config.rasi" = {
    text = builtins.readFile ../configs/rofi/config.rasi;
  };

  xdg.configFile."rofi/colors.rasi" = {
    text = builtins.readFile ../configs/rofi/colors.rasi;
  };
}
