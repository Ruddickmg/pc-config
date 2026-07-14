{ pkgs, ... }:
let
  socket_path = "/run/user/1000/gcr/ssh";
in
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        ForwardAgent = false;
        AddKeysToAgent = "yes";
        Compression = false;
        ServerAliveInterval = 0;
        ServerAliveCountMax = 3;
        HashKnownHosts = false;
        UserKnownHostsFile = "~/.ssh/known_hosts";
        ControlMaster = "no";
        ControlPath = "~/.ssh/master-%r@%n:%p";
        ControlPersist = "no";
      };
      "github.com" = {
        AddKeysToAgent = "yes";
        IdentityFile = "~/.ssh/github";
        IdentitiesOnly = true;
      };
      "media-server" = {
        HostName = "media-server";
        User = "media-server";
        AddKeysToAgent = "yes";
        IdentityFile = "~/.ssh/media-server";
      };
    };
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = socket_path;
  };

  systemd.user.services.gnome-keyring-ssh = {
    Unit = {
      Description = "GNOME Keyring SSH Agent";
      PartOf = "graphical-session.target";
      Before = [ "gcr-ssh-agent.service" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --foreground --components=ssh";
      Restart = "on-abort";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
