{pkgs, ...}:
with builtins; {
  virtualisation.virtualbox.host.enable = true;
}
