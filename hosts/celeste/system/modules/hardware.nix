{pkgs, ...}:
with builtins; {
  # XBox controller
  hardware.xpadneo.enable = true;
  boot.extraModprobeConfig = ''options bluetooth disable_ertm=1 ''; # Fix pls :)

  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];

  # 32-bit GPU drivers
  hardware.opengl.driSupport32Bit = true;

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
