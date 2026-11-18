{ ... }:
{
  # Tailscale-only SMB mounts. Automounts keep ~/Library available even when the
  # tailnet is down at boot; first access starts tailscaled and mounts.
  # public and library use port 445. Private uses the separate smbd listener on
  # TCP 1445 so Tailscale ACLs can grant it independently. Samba accepts guest
  # connections on all three.
  fileSystems."/mnt/nas/private" = {
    device = "//media-server/private";
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
      "x-systemd.automount"
      "x-systemd.idle-timeout=10min"
      "x-systemd.requires=tailscaled.service"
    ];
  };

  fileSystems."/mnt/nas/public" = {
    device = "//media-server/public";
    fsType = "cifs";
    options = [
      "vers=3.1.1"
      "nounix"
      "guest"
      "uid=1000"
      "gid=100"
      "file_mode=0664"
      "dir_mode=0775"
      "iocharset=utf8"
      "_netdev"
      "nofail"
      "x-systemd.automount"
      "x-systemd.idle-timeout=10min"
      "x-systemd.requires=tailscaled.service"
    ];
  };

  fileSystems."/mnt/nas/library" = {
    device = "//media-server/library";
    fsType = "cifs";
    options = [
      "vers=3.1.1"
      "nounix"
      "guest"
      "uid=1000"
      "gid=100"
      "file_mode=0664"
      "dir_mode=0775"
      "iocharset=utf8"
      "_netdev"
      "nofail"
      "x-systemd.automount"
      "x-systemd.idle-timeout=10min"
      "x-systemd.requires=tailscaled.service"
    ];
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
    "/mnt/nas/public".d = {
      mode = "0755";
      user = "root";
      group = "root";
    };
    "/mnt/nas/library".d = {
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
      argument = "/mnt/nas/public";
      user = "moon";
      group = "moon";
    };
    "/home/moon/Media".L = {
      argument = "/mnt/nas/library";
      user = "moon";
      group = "moon";
    };
  };
}
