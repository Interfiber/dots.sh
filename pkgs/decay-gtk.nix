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
    url = "https://github.com/decaycs/decay-gtk/archive/refs/heads/main.zip";
    sha256 = "sha256-vaLwt8PtS2HL/MXYuHrx1MgDMf8urWJNsLJ2BDClLFI=";
    stripRoot = false;
  };

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes/
    ls
    cd decay-gtk-main
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
