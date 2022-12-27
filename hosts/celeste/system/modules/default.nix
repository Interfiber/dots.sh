{...}: {
  imports = [
    ./boot.nix # Boot config/GRUB & Updated kernel
    ./services.nix # Services/programs I want
    ./system.nix # System config
    ./users.nix # User list
    ./systemd.nix # Systemd services
    ./packages.nix # System-level packages
    ./gaming.nix # Steam, and other game-related things
    ./fonts.nix # Fonts
    ./hardware.nix # Hardware config
  ];
}
