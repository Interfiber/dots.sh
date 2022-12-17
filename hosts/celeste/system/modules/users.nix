{pkgs, ...}:
with builtins; {
  users.users.interfiber = {
    isNormalUser = true;
    description = "Persephone";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
}
