{ pkgs-unstable, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs-unstable; [
    nerd-fonts.jetbrains-mono
    hicolor-icon-theme
    font-awesome
    pango
  ];
}
