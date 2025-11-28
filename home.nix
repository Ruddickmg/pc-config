{ pkgs, inputs, lib, pkgs-unstable, system, ... }:
{
  imports = [(import ./apps { inherit pkgs pkgs-unstable system lib inputs; })];

  home.packages = with pkgs; [ jq ];
  home.username = "moon";
  home.homeDirectory = "/home/moon";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "firefox";
    TERM = "kitty";
  };
  home.pointerCursor = with pkgs; {
    name = "Adwaita";
    package = adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
    gtk.enable = true;
   };
}
