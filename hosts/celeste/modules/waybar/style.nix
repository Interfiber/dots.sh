let
  Logo = builtins.fetchurl rec {
    name = "Logo-${sha256}.svg";
    url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg";
    sha256 = "14mbpw8jv1w2c5wvfvj8clmjw0fi956bq5xf9s2q3my14far0as8";
  };
in ''
  * {
    border: none;
    border-radius: 0;
    min-height: 0;
    font-family: Material Design Icons, JetBrainsMono Nerd Font Mono;
    font-size: 13px;
  }
  window#waybar {
    background-color: #151515;
    transition-property: background-color;
    transition-duration: 0.5s;
  }
  window#waybar.hidden {
    opacity: 0.5;
  }
  #workspaces {
    background-color: transparent;
  }
  #workspaces button {
    all: initial; /* Remove GTK theme values (waybar #1351) */
    min-width: 0; /* Fix weird spacing in materia (waybar #450) */
    box-shadow: inset 0 -3px transparent; /* Use box-shadow instead of border so the text isn't offset */
    padding: 6px 9px;
    margin: 6px 3px;
    background-color: #424242;
    color: #cdd6f4;
  }
  #workspaces button.active {
    color: #1e1e2e;
    background-color: #8DA3B9;
  }
  #workspaces button:hover {
   box-shadow: inherit;
   text-shadow: inherit;
   color: #1e1e2e;
   background-color: #98d3ee;
  }
  #workspaces button.urgent {
    background-color: #dd6777;
  }
  #custom-weather,
  #custom-swallow,
  #custom-power,
  #custom-todo,
  #custom-weather,
  #battery,
  #backlight,
  #pulseaudio,
  #network,
  #clock,
  #tray {
    margin: 6px 3px;
    padding: 6px 12px;
    background-color: #151720;
    color: #181825;
  }
  @keyframes blink {
    to {
      background-color: #f38ba8;
      color: #181825;
    }
  }
  .warning,
  .critical,
  .urgent,
  #battery.critical:not(.charging) {
    background-color: #f38ba8;
    color: #181825;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }
  #pulseaudio.microphone {
    background-color: #B66467;
  }
  #pulseaudio {
    background-color: #8AA6A2;
  }
  #network {
    background-color: #8C977D;
  }
  #clock.date {
    background-color: #8DA3B9;
  }
  #clock {
    background-color: #8DA3B9;
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
