{pkgs, ...}:
with builtins; {
  programs.zsh.enable = true;
  users.users.interfiber = {
    isNormalUser = true;
    description = "Persephone";
    extraGroups = ["networkmanager" "wheel" "vboxusers"];
    shell = pkgs.zsh;
  };
}
