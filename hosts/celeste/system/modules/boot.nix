{pkgs, ...}:
with builtins; {
  # Bootloader config
  boot.loader.grub.enable = true; # Enable grub
  boot.loader.grub.efiSupport = true; # EFI support in grub
  boot.loader.grub.device = "nodev"; # No device for grub
  boot.loader.grub.useOSProber = true; # Enable OSprober
  boot.loader.grub.theme = ./vimix; # Set grub theme
  boot.loader.grub.gfxmodeEfi = "3840x2160"; # Fix grub resolution

  boot.loader.grub.extraEntries = ''
    menuentry "UEFI Firmware Settings" {
        fwsetup
    }
  '';

  boot.loader.efi.canTouchEfiVariables = true; # Allow the bootloader to touch efi vars
  boot.loader.efi.efiSysMountPoint = "/boot/efi"; # EFI system mount point is /boot/efi

  # Kernel config
  boot.kernelPackages = pkgs.linuxPackages_latest; # Use latest kernel version, not the old NixOS one
  boot.initrd.kernelModules = ["amdgpu"]; # Not required, nice to have though, starts GPU drivers before systemd starts

  # etc
  boot.cleanTmpDir = true; # Dont keep crap laying around, saves disk space, and fixes problems with IPC sockets sometimes
}
