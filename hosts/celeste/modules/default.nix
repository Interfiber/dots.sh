{self, ...}: {
  imports = [
    ./hypr.nix # Wayland compositor config
    #    ./kitty.nix # Terminal config
    ./wezterm.nix # Terminal config
    ./rofi.nix # Launcher config
    ./dunst.nix # Notification server config
    ./gtk.nix # GTK config
    ./pkg.nix # Packages I need
    ./nvim.nix # Editor config
    ./zsh.nix # Zsh shell config
    ./exa.nix # Better ls
    ./git.nix # Git version control config
    ./waybar # Wayland bar
    ./swaylock.nix # Wayland lock screen
    ./pass.nix # Password manager
    ./mutt.nix # Command line email viewer
  ];
}
