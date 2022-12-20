{pkgs, ...}:
with builtins; {
  home.packages = with pkgs; [
    lxappearance
    pkgs.callPackage
    ../../../pkgs/swww.nix
    {}
  ];

  wayland.windowManager.hyprland.extraConfig = builtins.readFile ../configs/hypr/hyprland.conf;
}
