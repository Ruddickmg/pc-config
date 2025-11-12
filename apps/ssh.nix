{ ... }: {
  programs.ssh = {
    enabled = true;
    programs.ssh.extraConfig = ''
      Host github.com
        IdentityFile ~/.ssh/github
        IdentitiesOnly yes
    '';
  };
}