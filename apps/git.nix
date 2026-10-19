{ pkgs, pkgs-unstable, ... }: {
  home.packages = with pkgs; [
    git
    lazygit
    gnupg
    pkgs-unstable.worktrunk
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Ruddickmg";
        email = "ruddickmg@gmail.com";
        signingKey = "343E322A4E3B4C82";
      };
      commit.gpgSign = true;
      gpg.format = "openpgp";
    };
  };

  programs.lazygit = {
    enable = true;
    settings.git.overrideGpg = true;
  };
}
