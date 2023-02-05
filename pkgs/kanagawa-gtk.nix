{
  lib,
  stdenv,
  fetchzip,
  pkgs,
  ...
}:
stdenv.mkDerivation rec {
  pname = "kanagawa-gtk";
  version = "0.1.0";

  src = fetchzip {
    url = "https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme/archive/refs/heads/main.zip";
    sha256 = "sha256-Vb1T2xJybjt56VNK1Z9WsR+oeGcd9sp1cZd6a6dZqu0=";
    stripRoot = false;
  };

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes/
    cd Kanagawa-GKT-Theme-main
    cp -r themes/Kanagawa-B-LB $out/share/themes/
    cp -r themes/Kanagawa-B $out/share/themes/
    cp -r themes/Kanagawa-BL-LB $out/share/themes/
    cp -r themes/Kanagawa-BL  $out/share/themes/
  '';

  meta = {
    description = "Kanagawa GTK theme";
    homepage = "https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme";
    platforms = lib.platforms.unix;
    maintainers = [lib.maintainers.interfiber];
  };
}
