{ pkgs, inputs, lib, pkgs-unstable, system, config, ... }:
{
  imports = [(import ./apps { inherit pkgs pkgs-unstable system lib inputs config; })];

  home.packages = with pkgs; [ jq ];
  home.username = "moon";
  home.homeDirectory = "/home/moon";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    EDITOR = "nvim";
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