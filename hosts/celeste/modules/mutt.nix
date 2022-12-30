{pkgs, ...}:
with builtins; {
  home.packages = with pkgs; [
    neomutt
  ];

  home.configFile.mutt = {
    source = ../configs/mutt;
    recursive = true;
  };
}
