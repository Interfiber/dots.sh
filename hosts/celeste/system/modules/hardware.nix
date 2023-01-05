{pkgs, ...}:
with builtins; {
  # X-Box controller
  hardware.xpadneo.enable = true;
  boot.extraModprobeConfig = ''options bluetooth disable_ertm=1 ''; # Fix pls :)

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
