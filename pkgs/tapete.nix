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
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Interfiber";
    repo = "tapete";
    #    rev = "v${version}";
    #    hash = "sha256-9qTKaLfVeZD8tli7gqGa6gr1a2ptQRj4sf1XSPORo1s=";
  };

  cargoSha256 = "sha256-OWe+r8Vh09yfMFBjVH66i+J6RtHo1nDva0m1dJPZ4rE=";

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
