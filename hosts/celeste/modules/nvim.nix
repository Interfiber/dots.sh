{ pkgs, ... }:

with builtins;

{
  programs.neovim.enable = true;
  programs.neovim.vimAlias = true;

  xdg.configFile.nvim = {
    source = ../configs/nvim;
    recursive = true;
  };
}
