{ pkgs-unstable, ... }: {
  home.packages = with pkgs-unstable; [
   swww
#   rwpspread
  ];
}