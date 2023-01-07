{pkgs, ...}:
with builtins; {
  home.packages = with pkgs; [
    # user interfaces
    pcmanfm
    firefox-devedition-bin
    pavucontrol
    signal-desktop
    prismlauncher
    vscodium
    mpv

    # wayland
    grim
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
  ];
}
