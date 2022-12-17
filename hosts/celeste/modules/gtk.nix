{pkgs, ...}:
with builtins; {
  home.packages = with pkgs; [
    catppuccin-gtk
    catppuccin-cursors
    breeze-icons
    breeze-gtk
  ];
}
