{pkgs, ...}:
with builtins; {
  # X-Box controller
  hardware.xpadneo.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
