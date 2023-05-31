{pkgs, ...}:
with builtins; {
  home.packages = with pkgs; [
    pcmanfm # File browser
    firefox-devedition-bin # Firefox developer edition
    pavucontrol # Pulseaudio(or pipewire-pulse) audio gui
    signal-desktop # Messaging client
    prismlauncher # Minecraft launcher
    mpv # Video player

    grim # Wayland screenshot
    slurp # Select areas on screen
    feh # Image viewer

    neofetch # Flex

    # utils
    jq # Command line json parser
    btop # TUI process viewer
    psmisc # KILL THEM ALL, MAKE THEM SUFFER
    fzf # Fuzzy finder
    ripgrep # Better grep
    ffmpeg # Manipulate video, audio, and picture files
    gcc # Always have a C compiler
    unzip # Finally added this, after like 3 months of using this config
  ];
}
