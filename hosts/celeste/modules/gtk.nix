{pkgs, ...}:
with builtins; {
  gtk = {
    enable = true;
    theme = {
      name = "Decayce";
      package = pkgs.callPackage ../../../pkg/decay-gtk.nix {};
    };
  };
}
