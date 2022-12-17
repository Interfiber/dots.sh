{pkgs, ...}:
with builtins; {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;

      format = let
        git = "$git_branch$git_commit$git_state$git_status";
      in ''
        $directory(${git})$all
      '';

      right_format = "$status";

      character = {
        success_symbol = "[](bold green)";
        error_symbol = "[](bold red)";
        vicmd_symbol = "[](bold green)";
      };

      directory = {
        format = "[$path]($style)( [$read_only]($read_only_style)) ";
        disabled = false;
      };

      status = {
        format = "[$symbol]($style)";
        symbol = "[](bold red)";
        success_symbol = "[](bold green)";
        disabled = false;
      };

      git_status = {
        format = "([\\[$all_status$ahead_behind\\]]($style)) ";
        style = "bold red";
        ahead = ">";
        behind = "<";
        diverged = "<>";
        up_to_date = "";
        untracked = "?";
        stashed = "$";
        modified = "!";
        staged = "+";
        renamed = "r";
        deleted = "x";
        disabled = false;
      };

      cmd_duration.disabled = true;

      aws.symbol = "  ";
      conda.symbol = " ";
      dart.symbol = " ";
      directory.read_only = " ";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      gcloud.symbol = " ";
      git_branch.symbol = " ";
      golang.symbol = " ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = " ";
      nim.symbol = " ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      package.symbol = " ";
      perl.symbol = " ";
      php.symbol = " ";
      python.symbol = " ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      swift.symbol = "ﯣ ";
      terraform.symbol = "行 ";
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
