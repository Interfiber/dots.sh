{pkgs, ...}:
with builtins; {
  home.packages = with pkgs; [
    neomutt
    w3m
  ];

  xdg.configFile.mutt = {
    source = ../configs/mutt;
    recursive = true;
  };
}
