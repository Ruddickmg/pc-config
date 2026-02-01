{ pkgs, ... }:
let
  socket_path = "/run/user/1000/gcr/ssh";
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

  home.packages = with pkgs; [ gcr ];
  home.sessionVariables = {
    SSH_AUTH_SOCK = socket_path;
  };

  systemd.user = {
    services.gcr-ssh-agent = {
      Service = {
        ExecStart = "${pkgs.gcr}/lib/gcr-4/gcr-ssh-agent";
        Type = "simple";
      };
      Unit = {
        Description = "GCR SSH Agent Socket";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
    sockets.gcr-ssh-agent = {
      Unit = {
        description = "Unix socket for the lspmux server";
      };
      Socket = {
        ListenStream = socket_path;
      };
      Install = {
        WantedBy = [ "sockets.target" ];
      };
    };
  };
}
