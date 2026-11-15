{ pkgs, ... }:
{
  # 1. Prevent closing the lid from immediately suspending the laptop
  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";
  };

  # 2. Automatically suspend when background work, downloads, or builds finish
  services.autosuspend = {
    enable = true;

    settings = {
      interval = 30; # Check activity every 30 seconds
      idle_time = 900; # Wait 15 minutes (600s) of total inactivity before sleeping
      suspend_cmd = "${pkgs.systemd}/bin/systemctl suspend";
    };

    checks = {
      # Keep awake during Rust builds, Nix builds, AI agents, or CLI tasks
      # (Add or remove binary names here as needed)
      Processes = {
        processes = "cargo,rustc,nix-build,curl,wget,aria2c,rsync,opencode";
      };

      # Keep awake ONLY if a Zen Browser / Firefox .part file is actively receiving data (< 2 min old)
      ExternalCommand = {
        command = "${pkgs.findutils}/bin/find /home/moon/Downloads -maxdepth 1 -name '*.part' -mmin -2 -print -quit | ${pkgs.gnugrep}/bin/grep -q .";
      };

      # Keep awake whenever a browser or media player requests an idle/sleep lock
      LogindInhibitors = {
        types = "idle,sleep";
      };

      # Keep awake if CPU 1-minute load average is above 2.0
      Load = {
        threshold = 2.0;
      };
    };
  };
}
