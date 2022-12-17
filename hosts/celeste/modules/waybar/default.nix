{
  pkgs,
  lib,
  config,
  ...
}: let
  brightnessctl = pkgs.brightnessctl + "/bin/brightnessctl";
  pamixer = pkgs.pamixer + "/bin/pamixer";
in {
  xdg.configFile."waybar/style.css".text = import ./style.nix;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      patchPhase = ''
        substituteInPlace src/modules/wlr/workspace_manager.cpp --replace "zext_workspace_handle_v1_activate(workspace_handle_);" "const std::string command = \"${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch workspace \" + name_; system(command.c_str());"
      '';
    });

    settings = {
      mainBar = {
        position = "top";
        fixed-center = true;
        height = 34;
        modules-left = [
          "wlr/workspaces"
        ];

        modules-center = [];

        modules-right = [
          "pulseaudio#microphone"
          "pulseaudio"
          "network"
          "clock#date"
          "clock"
          "tray"
        ];

        "wlr/workspaces" = {
          on-click = "activate";
          format = "{name}";
          all-outputs = true;
          disable-scroll = true;
          active-only = false;
        };

        tray = {
          spacing = 10;
        };

        clock = {
          tooltip = false;
          format = "󱑎 {:%H:%M}";
        };

        "clock#date" = {
          format = "󰃶 {:%a %d %b}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };

        network = {
          format-wifi = "󰖩 {essid}";
          format-ethernet = "󰈀 {ipaddr}/{cidr}";
          format-alt = "󱛇";
          format-disconnected = "󰖪";
          tooltip-format = ''
            󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}
            {ipaddr}/{ifname} via {gwaddr} ({signalStrength}%)'';
        };

        pulseaudio = {
          tooltip = false;
          format = "{icon} {volume}%";
          format-muted = "󰖁";
          format-icons = {default = ["󰕿" "󰖀" "󰕾"];};
          tooltip-format = "{desc}, {volume}%";
          on-click = "${pamixer} -t";
          on-scroll-up = "${pamixer} -i 1";
          on-scroll-down = "${pamixer} -d 1";
        };

        "pulseaudio#microphone" = {
          tooltip = false;
          format = "{format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭";
          on-click = "${pamixer} --default-source -t";
          on-scroll-up = "${pamixer} --default-source -i 1";
          on-scroll-down = "${pamixer} --default-source -d 1";
        };
      };
    };
  };
}
