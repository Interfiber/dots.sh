{pkgs, ...}:
with builtins; {
  # Pipewire
  hardware.pulseaudio.enable = false; # Disable pulseaudio

  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.pulse.enable = true;

  # X11
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;

  # XDG desktop portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  # Fix GNOME programs
  programs.dconf.enable = true;

  # Security
  security.doas.enable = true; # replacement for sudo
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Yubi key
  services.pcscd.enable = true;
  services.udev.packages = [pkgs.yubikey-personalization];

  environment.systemPackages = with pkgs; [gnupg pinentry-gtk2];

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gtk2";
  };

  security.pam.yubico = {
    enable = true;
    debug = false;
    mode = "challenge-response";
  };
}
