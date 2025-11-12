{ pkgs, ... }: {
  home.packages = with pkgs; [ git ];
  programs.git = {
    enable = true;
    userName = "Ruddickmg";
    userEmail = "ruddickmg@gmail.com";
  };
}
