{pkgs, ...}:
with builtins; {
  nixpkgs.overlays = let
    discordOverlay = self: super: {
      discord = super.discord.override {withOpenASAR = true;}; # Discord with openASR is faster
    };
  in [discordOverlay];

  home.packages = with pkgs; [
    # user interfaces
    discord
    pcmanfm
    librewolf
    pavucontrol
    pinentry-qt
    signal-desktop
    prismlauncher
    vscodium
    mpv

    # wayland
    grim

    # flex
    pfetch

    # utils
    fd
    btop
    psmisc
    fzf
    ripgrep
    ffmpeg
    gcc # Always have a C compiler
  ];
}
