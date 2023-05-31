{
  pkgs,
  inputs,
  config,
  ...
}: {
  nix.package = pkgs.nixVersions.stable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Allows steam to be installed
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    substituters = ["https://hyprland.cachix.org" "https://nix-gaming.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
    auto-optimise-store = true;
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    curl
    git
    polkit_gnome
    inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.wine-tkg # installs a package

    (appimageTools.wrapType2
      {
        # or wrapType1
        name = "WebCord";
        src = fetchurl {
          url = "https://github.com/SpacingBat3/WebCord/releases/download/v4.1.1/WebCord-4.1.1-x64.AppImage";
          sha256 = "sha256-wYrCTt1Wx0g8InfdRLz0zGBXwCa/eDLtJfg4ag9+4y4=";
        };
        extraPkgs = pkgs: with pkgs; [pipewire libdrm];
      })
  ];

  programs.sway.enable = true;

  # Nerd Fonts
  fonts.fonts = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono" "FantasqueSansMono"];})
    termsyn
  ];
}
