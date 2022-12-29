{
  lib,
  stdenv,
  fetchFromGitHub,
  pkg-config,
  libxkbcommon,
  wayland,
  wayland-protocols,
  wayland-scanner,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "tapete";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "Interfiber";
    repo = "tapete";
    rev = "v${version}";
    hash = "sha256-yqIRThvUx7tNgdvrj7cWriycp/Xl28UdjEqypZGhtOQ=";
  };

  cargoSha256 = "sha256-lOJGR86zymG4ePzjqvbhafzswz4Sq//OlJ/vy26406Q=";

  strictDeps = true;
  depsBuildBuild = [pkg-config];
  nativeBuildInputs = [pkg-config wayland-scanner libxkbcommon];
  buildInputs = [wayland wayland-protocols];

  doCheck = false;

  meta = with lib; {
    description = "Simple wayland wallpaper daemon";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
