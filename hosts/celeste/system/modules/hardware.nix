{pkgs, ...}:
with builtins; {
  # X-Box controller
  hardware.xpadneo.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
    General = {
      ControllerMode = "dual";
      JustWorksRepairing = "confirm";
    };
  };

  services.blueman.enable = true;
}
