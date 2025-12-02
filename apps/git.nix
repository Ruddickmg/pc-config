{ pkgs, ... }: {
  home.packages = with pkgs; [ git ];
  programs.git = {
    enable = true;
    settings.user = {
      name = "Ruddickmg";
      email = "ruddickmg@gmail.com";
    };
  };
}
