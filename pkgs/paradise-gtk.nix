{
  lib,
  stdenv,
  fetchzip,
  pkgs,
  ...
}:
stdenv.mkDerivation rec {
  pname = "paradise-gtk";
  version = "0.1.0";

  src = fetchzip {
    url = "https://github.com/paradise-theme/gtk/archive/19afc8d54a96a2be5b5cf878ad988a0e0afba284.zip";
    sha256 = "sha256-nmq7KQ/uyRU7hTE4l4qkYst/cB5LqtDOr4pEAwQyLFg=";
    stripRoot = false;
  };

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes/
    cd decay-gtk-0.1.0
    cp -r Themes/Decayce $out/share/themes/
    cp -r Themes/Dark-decay $out/share/themes/
    cp -r Themes/Light-decay $out/share/themes/
  '';

  meta = {
    description = "Paradise GTK theme";
    homepage = "https://github.com/paradise-theme/gtk";
    platforms = lib.platforms.unix;
    maintainers = [lib.maintainers.interfiber];
  };
}
