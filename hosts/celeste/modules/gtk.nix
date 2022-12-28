{pkgs, ...}:
with builtins; {
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };

    iconTheme = {
      name = "breeze-dark";
      package = pkgs.breeze-icons;
    };
    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-button-images = 1;
    };
    gtk2.extraConfig = ''
      gtk-xft-antialias=1
      gtk-button-images=1
    '';
  };

  home.pointerCursor = {
    name = "Breeze_Snow";
    package = pkgs.breeze-gtk;
    size = 16;
  };

  home.packages = with pkgs; [
    lxappearance
  ];

  home.pointerCursor.gtk.enable = true;
}
