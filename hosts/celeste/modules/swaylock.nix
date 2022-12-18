{pkgs, ...}:
with builtins; {
  home.packages = with pkgs; [swaylock-effects];

  programs.swaylock = {
  };
}
