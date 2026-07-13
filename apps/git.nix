{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    lazygit
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "Ruddickmg";
      email = "ruddickmg@gmail.com";
    };
  };

  programs.lazygit = {
    enable = true;
  };
}
