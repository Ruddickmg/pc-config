{ ... }: {
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host github.com
        IdentityFile ~/.ssh/github
        IdentitiesOnly yes
    '';
  };
}