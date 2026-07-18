{ pkgs, ... }:
{
  systemd.user.services.awww-daemon = {
    Unit = {
      Description = "An Answer to your Wayland Wallpaper Woes";
      BindsTo = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.awww}/bin/awww-daemon";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  systemd.user.services.awww-wallpaper = {
    Unit = {
      Description = "Set animated wallpaper";
      After = [ "awww-daemon.service" ];
      Requires = [ "awww-daemon.service" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.awww}/bin/awww img /home/moon/Pictures/wallpapers/wallpaper.gif";
    };
    Install = {
      WantedBy = [ "awww-daemon.service" ];
    };
  };
}
