{pkgs, ...}:
with builtins; {
  home.packages = with pkgs; [
    neomutt
  ];

  xdg.configFile.mutt = {
    source = ../configs/mutt;
    recursive = true;
  };
}
