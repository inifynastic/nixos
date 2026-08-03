{ pkgs, ... }:

{
  home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "capitaine-cursors";
      size = 24;
      package = pkgs.capitaine-cursors;
  };

  services.swayidle = {
    enable = true;
    timeouts = [
    {
      timeout = 600;
      command = "swaylock -f";
    }
    {
      timeout = 900;
      command = "niri msg action power-off-monitors";
      resumeCommand = "niri msg action power-on-monitors";
    }
    {
      timeout = 1800;
      command = "systemctl suspend";
    }
    ];

    events = {
      "before-sleep" = "swaylock -f";
    };
  };
}