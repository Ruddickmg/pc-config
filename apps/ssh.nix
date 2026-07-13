{ pkgs, ... }:
let
  socket_path = "/run/user/1000/keyring/ssh";
in
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
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
    extraConfig = ''
      Host github.com
        AddKeysToAgent yes
        IdentityFile ~/.ssh/github
        IdentitiesOnly yes
    '';
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = socket_path;
  };

  systemd.user.services.gnome-keyring-ssh = {
    Unit = {
      Description = "GNOME Keyring SSH Agent";
      PartOf = "graphical-session.target";
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --foreground --components=ssh";
      Restart = "on-abort";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
