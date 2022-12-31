{pkgs, ...}:
with builtins; {
  virtualisation.libvirtd.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager ];
}
