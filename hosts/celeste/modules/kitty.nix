{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font Mono";
      font_size = 30;
      cursor_shape = "Beam";
      window_padding_width = 5;

      background = "#1F1F28";
      foreground = "#DCD7BA";
      selection_background = "#2D4F67";
      selection_foreground = "#C8C093";
      url_color = "#72A7BC";
      cursor = "#C8C093";

      # Tabs
      active_tab_background = "#1F1F28";
      active_tab_foreground = "#DCD7BA";
      inactive_tab_background = "#1F1F28";
      inactive_tab_foreground = "#C8C093";
      #tab_bar_background #15161E

      # normal
      color0 = "#090618";
      color1 = "#C34043";
      color2 = "#76946A";
      color3 = "#C0A36E";
      color4 = "#7E9CD8";
      color5 = "#957FB8";
      color6 = "#6A9589";
      color7 = "#C8C093";

      # bright
      color8 = "#727169";
      color9 = "#E82424";
      color10 = "#98BB6C";
      color11 = "#E6C384";
      color12 = "#7FB4CA";
      color13 = "#938AA9";
      color14 = "#7AA89F";
      color15 = "#DCD7BA";

      # extended colors
      color16 = "#FFA066";
      color17 = "#FF5D62";

      tab_bar_min_tabs = 1;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";
    };
  };
}
