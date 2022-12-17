{pkgs, ...}:
with builtins; {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # character = {
      #   success_symbol = "";
      # };
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    dotDir = ".config/zsh";

    envExtra = ''

      export GDK_BACKEND=x11 # fix GTK themes, and some programs not running
      export GDK_SCALE=1 # fix steam floating awayyyyyyy

      export EDITOR="nvim"
      export TERMINAL="kitty"
      export BROWSER="firefox"

      export XDG_DATA_HOME="$HOME/.local/share"
      export XDG_CONFIG_HOME="$HOME/.config"
      export WINEPREFIX="$XDG_DATA_HOME/wine/prefixes/default"
      export LESSHISTFILE="-"
      export WGETRC="$HOME/.config/wget/wgetrc"
      export GNUPGHOME="$XDG_DATA_HOME/gnupg"
      export PATH=$HOME/.local/share/bin:$PATH

      alias sudo="doas"

      pfetch
    '';
  };
}
