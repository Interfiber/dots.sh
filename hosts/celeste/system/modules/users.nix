{pkgs, ...}:
with builtins; {
  users.users.interfiber = {
    isNormalUser = true;
    description = "Persephone";
    extraGroups = ["networkmanager" "wheel" "libvirtd"];
    shell = pkgs.zsh;
  };
}
