{
  lib,
  stdenv,
  fetchurl,
  pkgs,
  ...
}:
stdenv.mkDerivation rec {
  pname = "webcord";
  version = "0.1.0";

  src = fetchurl {
    url = "https://github.com/SpacingBat3/WebCord/releases/download/v4.1.1/WebCord-4.1.1-x64.AppImage";
    sha256 = "sha256-wYrCTt1Wx0g8InfdRLz0zGBXwCa/eDLtJfg4ag9+4y4=";
  };

  nativeBuildInputs = with pkgs; [appimage-run];
  buildInputs = with pkgs; [makeWrapper];

  installPhase = ''
    echo "Installing appimage"
    ls
  '';

  meta = {
    description = "Decay GTK theme";
    homepage = "https://github.com/decaycs/decay-gtk";
    platforms = lib.platforms.unix;
    maintainers = [lib.maintainers.interfiber];
  };
}
