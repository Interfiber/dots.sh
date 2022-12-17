{pkgs, ...}:
with builtins; {
  programs.exa.enable = true;
  programs.exa.enableAliases = true;
}
