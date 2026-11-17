{ ... }:
{
  # Tailscale-only private share. The automount keeps ~/nas available even when
  # the tailnet is down at boot; the first access starts tailscaled and mounts.
  # It uses a separate smbd listener (TCP 1445) so Tailscale ACLs can grant the
  # public share on 445 independently. Samba accepts guest connections there.
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

  # Create the mount point early, then expose it at ~/nas.
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
    "/home/moon/nas".L = {
      argument = "/mnt/nas/private";
      user = "moon";
      group = "moon";
    };
  };
}
