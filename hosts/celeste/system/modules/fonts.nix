{
  pkgs,
  lib,
  ...
}:
with builtins; {
  fonts = {
    fonts = lib.attrValues {
      inherit
        (pkgs)
        material-icons
        material-design-icons
        noto-fonts-emoji
        ;
    };
    fontconfig = {
      enable = true;
    };
  };
}
