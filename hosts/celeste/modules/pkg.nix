{pkgs, ...}:
with builtins; {
  home.packages = with pkgs; [
    # user interfaces
    gnome.nautilus
    firefox-devedition-bin
    pavucontrol
    signal-desktop
    prismlauncher
    vscodium
    mpv

    # wayland
    grim
    slurp
    feh

    # flex
    pfetch

    # utils
    fd
    jq # yay json parsing
    btop
    psmisc
    fzf
    ripgrep
    ffmpeg
    gcc # Always have a C compiler

    grapejuice
  ];
}
