{ pkgs, ...}: {
  stylix.icons = with pkgs; {
    enable = true;
    dark = "Orange";
    package = nordzy-icon-theme;
  };
}