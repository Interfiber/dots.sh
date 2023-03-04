{
  lib,
  stdenv,
  fetchzip,
  pkgs,
  ...
}:
stdenv.mkDerivation rec {
  pname = "decay-gtk";
  version = "0.1.0";

  src = fetchzip {
    url = "https://github.com/decaycs/decay-gtk/archive/19a60e6f83f5c8193ce3b44f693d8cd8d17eef53.zip";
    sha256 = "sha256-k3Wj3WpD595a5Ut3abH8uXX2PgZGRLoHq6ppwi/W3wE=";
    stripRoot = false;
  };

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes/
    cd decay-gtk-19a60e6f83f5c8193ce3b44f693d8cd8d17eef53
    cp -r Themes/Dark-decay $out/share/themes
    cp -r Themes/Decayce $out/share/themes
    cp -r Themes/Light-decay $out/share/themes
  '';

  meta = {
    description = "Decay GTK theme";
    homepage = "https://github.com/decaycs/decay-gtk";
    platforms = lib.platforms.unix;
    maintainers = [lib.maintainers.interfiber];
  };
}
