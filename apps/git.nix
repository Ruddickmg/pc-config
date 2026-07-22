{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    lazygit
    gnupg
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Ruddickmg";
        email = "ruddickmg@gmail.com";
      };
      commit.gpgSign = true;
      gpg.format = "gpg";
    };
  };

  programs.lazygit = {
    enable = true;
  };
}
