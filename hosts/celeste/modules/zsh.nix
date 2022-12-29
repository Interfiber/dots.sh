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

            export GDK_SCALE=1 # fix steam floating awayyyyyyy
            export MOZ_ENABLE_WAYLAND=1 # Firefox under wayland
            export GDK_BACKEND=wayland

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

      # syntax config
      ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
      typeset -gA ZSH_HIGHLIGHT_STYLES
      ZSH_HIGHLIGHT_STYLES[comment]='fg=#990000'
      ZSH_HIGHLIGHT_STYLES[alias]='fg=#005FD7'
      ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#005FD7'
      ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#005FD7'
      ZSH_HIGHLIGHT_STYLES[function]='fg=#005FD7'
      ZSH_HIGHLIGHT_STYLES[command]='fg=#005FD7'
      ZSH_HIGHLIGHT_STYLES[precommand]='fg=#005FD7,italic'
      ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#005FD7,italic'
      ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#00AFFF'
      ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#00AFFF'
      ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#00AFFF'
      ## Keywords
      ## Built ins
      ZSH_HIGHLIGHT_STYLES[builtin]='fg=#005FD7'
      ## Punctuation
      ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#FF79C6'
      ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#FF79C6'
      ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#FF79C6'
      ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#FF79C6'
      ## Serializable / Configuration Languages
      ## Storage
      ## Strings
      ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#F1FA8C'
      ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#F1FA8C'
      ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#F1FA8C'
      ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#FF5555'
      ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#F1FA8C'
      ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#FF5555'
      ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#F1FA8C'
      ## Variables
      ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#FF5555'
      ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[assign]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#F8F8F2'
      ## No category relevant in spec
      ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#FF5555'
      ZSH_HIGHLIGHT_STYLES[path]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#FF79C6'
      ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#FF79C6'
      ZSH_HIGHLIGHT_STYLES[globbing]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#BD93F9'
      #ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
      #ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
      #ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
      #ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
      ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#FF5555'
      ZSH_HIGHLIGHT_STYLES[redirection]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[arg0]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[default]='fg=#F8F8F2'
      ZSH_HIGHLIGHT_STYLES[cursor]='standout'


            pfetch
    '';
  };
}
