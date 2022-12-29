{
  pkgs,
  lib,
  ...
}:
with builtins; {
  home.packages = with pkgs; [
    libnotify
  ];

  services.dunst = {
    enable = true;

    settings = {
      "global" = {
        frame_color = "#89B4FA";
        frame_width = 2;

        show_indicators = "no";
        corner_radius = 0;
        max_icon_size = 140;
        width = 600;
        origin = "top-right";

        progress_bar = true;
        progress_bar_height = 8;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        separator_height = 2;

        separator_color = "frame";
        font = "JetBrainsMono Nerd Font Mono 18";
        force_xwayland = false;
      };

      "urgency_low" = {
        background = "#151515";
        foreground = "#8C977D";
      };

      "urgency_normal" = {
        background = "#151515";
        foreground = "#E8E3E3";
      };

      "urgency_critical" = {
        background = "#151515";
        foreground = "#B66467";
      };
    };
  };
}
