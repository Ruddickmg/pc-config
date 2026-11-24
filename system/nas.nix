{ pkgs, ... }:
{
  # No boot mount or automount: an unavailable share must degrade to a plain
  # directory, otherwise directory scans block until a CIFS timeout. The
  # Tailscale FQDN forces the SMB connection onto tailscale0, not the physical LAN.
  # nas-remount (below) starts these mounts once media-server is reachable.
  fileSystems."/mnt/nas/private" = {
    device = "//media-server.tailbac0df.ts.net/private";
    fsType = "cifs";
    options = [
      "vers=3.1.1"
      "nounix"
      "guest"
      "port=1445"
      "uid=1000"
      "gid=100"
      "file_mode=0664"
      "dir_mode=0775"
      "iocharset=utf8"
      "_netdev"
      "nofail"
      "noauto"
      "x-systemd.requires=tailscaled.service"
      "x-systemd.mount-timeout=10s"
    ];
  };

  fileSystems."/mnt/nas/shared" = {
    device = "//media-server.tailbac0df.ts.net/shared";
    fsType = "cifs";
    options = [
      "vers=3.1.1"
      "nounix"
      "guest"
      "port=1445"
      "uid=1000"
      "gid=100"
      "file_mode=0664"
      "dir_mode=0775"
      "iocharset=utf8"
      "_netdev"
      "nofail"
      "noauto"
      "x-systemd.requires=tailscaled.service"
      "x-systemd.mount-timeout=10s"
    ];
  };

  fileSystems."/mnt/nas/media" = {
    device = "//media-server.tailbac0df.ts.net/media";
    fsType = "cifs";
    options = [
      "vers=3.1.1"
      "nounix"
      "guest"
      "port=1445"
      "uid=1000"
      "gid=100"
      "file_mode=0664"
      "dir_mode=0775"
      "iocharset=utf8"
      "_netdev"
      "nofail"
      "noauto"
      "x-systemd.requires=tailscaled.service"
      "x-systemd.mount-timeout=10s"
    ];
  };

  fileSystems."/mnt/nas/torrents" = {
    device = "//media-server.tailbac0df.ts.net/torrents";
    fsType = "cifs";
    options = [
      "vers=3.1.1"
      "nounix"
      "guest"
      "port=1445"
      "uid=1000"
      "gid=100"
      "file_mode=0664"
      "dir_mode=0775"
      "iocharset=utf8"
      "_netdev"
      "nofail"
      "noauto"
      "x-systemd.requires=tailscaled.service"
      "x-systemd.mount-timeout=10s"
    ];
  };

  # Start the noauto mounts when the server is reachable. Nothing is mounted on
  # demand, so a dead server never makes a directory listing wait for a CIFS timeout.
  systemd.services.nas-remount = {
    description = "Remount NAS shares when media-server is reachable";
    serviceConfig = {
      Type = "oneshot";
      TimeoutStartSec = "30s";
    };
    script = ''
      # netcat isn't in the systemd service PATH; use bash's /dev/tcp with a
      # short timeout instead of adding another package to the closure.
      if ! timeout 2 ${pkgs.bash}/bin/bash -c 'exec 3<>/dev/tcp/media-server.tailbac0df.ts.net/1445' \
        >/dev/null 2>&1; then
        exit 0
      fi

      for share in private shared media torrents; do
        unit="mnt-nas-''${share}.mount"
        systemctl is-active --quiet "$unit" && continue
        systemctl start "$unit" || true
      done
    '';
  };

  systemd.timers.nas-remount = {
    description = "Start NAS mounts once media-server is reachable";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "15s";
      OnUnitActiveSec = "30s";
      AccuracySec = "5s";
    };
  };

  systemd.tmpfiles.settings."10-nas" = {
    "/mnt/nas".d = {
      mode = "0755";
      user = "root";
      group = "root";
    };
    "/mnt/nas/private".d = {
      mode = "0755";
      user = "root";
      group = "root";
    };
    "/mnt/nas/shared".d = {
      mode = "0755";
      user = "root";
      group = "root";
    };
    "/mnt/nas/media".d = {
      mode = "0755";
      user = "root";
      group = "root";
    };
    "/mnt/nas/torrents".d = {
      mode = "0755";
      user = "root";
      group = "root";
    };
    "/home/moon/Library".d = {
      mode = "0755";
      user = "moon";
      group = "moon";
    };
    "/home/moon/Library".L = {
      argument = "/mnt/nas/private";
      user = "moon";
      group = "moon";
    };
    "/home/moon/Shared".L = {
      argument = "/mnt/nas/shared";
      user = "moon";
      group = "moon";
    };
    "/home/moon/Media".L = {
      argument = "/mnt/nas/media";
      user = "moon";
      group = "moon";
    };
    "/home/moon/Torrents".L = {
      argument = "/mnt/nas/torrents";
      user = "moon";
      group = "moon";
    };
  };
}
