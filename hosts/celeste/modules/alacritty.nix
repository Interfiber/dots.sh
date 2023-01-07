{lib, ...}:
with builtins; {
  programs.alacritty = {
    enable = true;
    extraConfig = builtins.readFile ../configs/alacritty/alacritty.yml;
  };
}
