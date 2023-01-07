{pkgs, ...}:
with builtins; {
  gtk = {
    enable = true;
    theme = {
      name = "Kanagawa-B";
      package = pkgs.callPackage ../../../pkgs/kanagawa-gtk.nix {};
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

  home.pointerCursor.gtk.enable = true;
}
