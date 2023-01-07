{lib, ...}:
with builtins; {
  programs.alacritty = {
    enable = true;
  };

  xdg.configFile."alacritty/alacritty.yml".text = builtins.readFile ../configs/alacritty/alacritty.yml;
}
