{ config, pkgs, lib, pkgs-unstable, jetbrains-plugins, system, ... }:
{
  imports = [
    (import ./apps {
      pkgs = pkgs;
      pkgs-unstable = pkgs-unstable;
      jetbrains-plugins = jetbrains-plugins;
      system = system;
      lib = lib;
    })
  ];

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