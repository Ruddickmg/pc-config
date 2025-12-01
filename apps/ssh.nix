{ ... }: {
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host github.com
        AddKeysToAgent yes
        IdentityFile ~/.ssh/github
        IdentitiesOnly yes
    '';
  };
}
