{pkgs, ...}:
with builtins; {
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font Mono";
      font_size = 30;
      cursor_shape = "Beam";
      background = "#0d0f18";
      foreground = "#a5b6cf";

      # The 16 terminal colors

      # black
      color0 = "#151720";
      color8 = "#1c1e27";

      # red
      color1 = "#dd6777";
      color9 = "#e26c7c";

      # green
      color2 = "#90ceaa";
      color10 = "#95d3af";

      # yellow
      color3 = "#ecd3a0";
      color11 = "#f1d8a5";

      # blue
      color4 = "#86aaec";
      color12 = "#8baff1";

      # magenta
      color5 = "#c296eb";
      color13 = "#c79bf0";

      # cyan
      color6 = "#93cee9";
      color14 = "#98d3ee";

      # white
      color7 = "#cbced3";
      color15 = "#d0d3d8";

      # Cursor
      cursor = "#cbced3";
      cursor_text_color = "#a5b6cf";

      # Selection highlight
      selection_foreground = "#a5b6cf";
      selection_background = "#1c1e27";
    };
  };
}
