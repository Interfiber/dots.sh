{ pkgs, ... }:

with builtins;

{
  # Bootloader config
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Kernel config
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "amdgpu" ]; # Not required, nice to have though

  # etc
  boot.cleanTmpDir = true; # Dont keep crap laying around, saves disk space, and fixes problems with IPC sockets sometimes
}
