let
  Logo = builtins.fetchurl rec {
    name = "Logo-${sha256}.svg";
    url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg";
    sha256 = "14mbpw8jv1w2c5wvfvj8clmjw0fi956bq5xf9s2q3my14far0as8";
  };
  colors = import ../theme/colors.nix {};
in ''
  window#waybar {
    background-color: ${colors.bg};
    color: ${colors.fg}
  }

  #workspaces {
    background-color: transparent;
    font-family: JetBrains Mono Nerd Font;
    font-size: 18px;
  }
  #workspaces button {
    all: unset; /* Remove GTK theme values (waybar #1351) */
    transition: all ease 0.6s;
    margin: 3px 6px;
    border-radius: 4px;
  }
  #workspaces button.active {
    color: ${colors.magenta};
    background-color: ${colors.black};
    border-left: solid 1px ${colors.magenta};
    border-top-left-radius: 0px;
    border-bottom-left-radius: 0px;
  }
  #workspaces button:hover {
   background-color: ${colors.dimblack};
  }
  #workspaces button.urgent {
    background-color: ${colors.red};
  }
  #pulseaudio,
  #network,
  #clock,
  #tray {
    margin: 0px 6px 6px 6px;
    padding: 4px 7px 6px 0px;
    background-color: ${colors.black};
    color: ${colors.green};
    font-family: JetBrains Mono Nerd Font;
    font-size: 18px;
    border-bottom-left-radius: 4px;
    border-bottom-right-radius: 4px;
  }

  #pulseaudio {
    background-color: ${colors.black};
  }
  #network {
    background-color: ${colors.black};
  }
  #clock.date {
    background-color: ${colors.black};
  }
  #clock {
    background-color: ${colors.black};
  }
  tooltip {
    font-family: "Inter", sans-serif;
    border-radius: 8px;
    padding: 20px;
    margin: 30px;
  }
  tooltip label {
    font-family: "Inter", sans-serif;
    padding: 20px;
  }
''
