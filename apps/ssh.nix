{ lib, ... }:
{
  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = lib.mkForce false;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "no";
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
}
