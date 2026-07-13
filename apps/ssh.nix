{ pkgs, ... }:
let
  socket_path = "/run/user/1000/gcr/ssh";
in
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        forwardAgent = false;
        addKeysToAgent = "yes";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };
      "github.com" = {
        addKeysToAgent = "yes";
        identityFile = "~/.ssh/github";
        identitiesOnly = true;
      };
      "media-server" = {
        hostName = "media-server";
        addKeysToAgent = "yes";
        identityFile = "~/.ssh/media-server";
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
