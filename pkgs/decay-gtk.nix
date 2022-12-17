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
    url = "https://github.com/decaycs/decay-gtk/archive/refs/tags/v0.1.0.zip";
    sha256 = "da41a8313be486c203a27e90439b67303d3588e7d8f2d60c92f8194af37d7141";
    stripRoot = false;
  };

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes/
    cp -r Themes/Decayce $out/share/themes/
    cp -r Themes/Dark-decay $out/share/themes/
    cp -r Themes/Light-decay $out/share/themes/
  '';

  meta = {
    description = "Decay GTK theme";
    homepage = "https://github.com/decaycs/decay-gtk";
    platforms = lib.platforms.unix;
    maintainers = [lib.maintainers.interfiber];
  };
}
