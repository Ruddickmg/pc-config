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
                
  # mouse configuration
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    x11.enable = true;
    x11.defaultCursor = "Adwaita";
  };
}