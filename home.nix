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

  home.username = "moon";
  home.homeDirectory = "/home/moon";
  home.stateVersion = "25.05";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    jq # A lightweight and flexible command-line JSON processor
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}