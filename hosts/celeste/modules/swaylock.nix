{
  pkgs,
  lib,
  config,
  ...
}:
with builtins; {
  home.packages = with pkgs; [swaylock-effects];

  programs.swaylock = {
    settings = {
      image = "/home/interfiber/.df/hosts/celeste/modules/swaylock_image.png";
      clock = true;
      color = "00000000";
      font = "JetBrainsMono Nerd Font Mono";
      show-failed-attempts = false;
      indicator = true;
      indicator-radius = 200;
      indicator-thickness = 20;
      line-color = "#151515"; # Color for line
      ring-color = "#151515"; # Background color
      inside-color = "#151515"; # Background color for internal ring
      key-hl-color = "#8DA3B9";
      separator-color = "00000000";
      text-color = "#cdd6f4";
      text-caps-lock-color = "";
      line-ver-color = "#151515";
      ring-ver-color = "#151515";
      inside-ver-color = "#151515";
      text-ver-color = "#E8E3E3";
      ring-wrong-color = "#151515";
      text-wrong-color = "#E8E3E3";
      inside-wrong-color = "#151515";
      inside-clear-color = "#151515";
      text-clear-color = "#E8E3E3";
      ring-clear-color = "#151515";
      line-clear-color = "#151515";
      line-wrong-color = "#151515";
      bs-hl-color = "#f38ba8";
      line-uses-ring = false;
      datestr = "%d.%m";
      effect-blur = "5x5";
      ignore-empty-password = true;
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }
    ];

    timeouts = [
      {
        timeout = 100;
        command = "${pkgs.libnotify}/bin/notify-send \"Locking screen in 20 seconds!\"";
      }
      {
        timeout = 120;
        command = "${pkgs.swaylock-effects}/bin/swaylock -f";
      }
    ];
  };

  systemd.user.services.swayidle.Install.WantedBy = lib.mkForce ["hyprland-session.target"];
}
