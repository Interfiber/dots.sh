{pkgs, ...}:
with builtins; {
  gtk = {
    enable = true;
    theme = {
      name = "Decayce";
      package = pkgs.callPackage ../../../pkgs/decay-gtk.nix {};
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
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

  home.pointerCursor.gtk.enable = true;
}
