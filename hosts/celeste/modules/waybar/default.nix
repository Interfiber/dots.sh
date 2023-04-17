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
  xdg.configFile."waybar/launch.sh".text = "#!/usr/bin/env bash\nexport GDK_BACKEND=wayland\nwaybar";

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
        position = "left";
        layer = "top";
        fixed-center = true;
        width = 40;
        modules-left = [
          "wlr/workspaces"
        ];

        modules-center = ["custom/rapd"];

        modules-right = [
          "pulseaudio"
          "network"
          "tray"
        ];

        "custom/rapd" = {
          exec = "/home/interfiber/.df/hosts/celeste/scripts/waybar-rapd";
          return-type = "json";
        };

        "wlr/workspaces" = {
          on-click = "activate";
          format = "{name}";
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
          format-wifi = "󰖩";
          format-disconnected = "睊";
          tooltip = false;
        };

        pulseaudio = {
          format = "{icon}";
          format-bluetooth = "{icon}";
          format-muted = "婢";
          on-click = "pavucontrol";
          format-icons = {
            headphone = "";
            default = ["" "" "墳" ""];
          };
        };
      };
    };
  };
}
