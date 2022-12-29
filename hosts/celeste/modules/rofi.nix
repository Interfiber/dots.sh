{
  pkgs,
  lib,
  ...
}:
with builtins; {
  programs.rofi = {
    enable = true;
    theme = ../configs/rofi/theme.rasi;
  };

  xdg.configFile."rofi/config.rasi" = {
    text = builtins.readFile ../configs/rofi/config.rasi;
  };

  xdg.configFile."rofi/colors.rasi" = {
    text = builtins.readFile ../configs/rofi/colors.rasi;
  };
}
