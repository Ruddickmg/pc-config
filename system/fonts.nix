{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    hicolor-icon-theme
    font-awesome
    pango
  ];
}