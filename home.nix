{
  pkgs,
  inputs,
  lib,
  pkgs-unstable,
  pkgs-rust,
  system,
  firefox-addons,
  rustToolChain,
  ...
}:
{
  imports = [
    (import ./apps {
      inherit
        pkgs
        pkgs-unstable
        system
        lib
        inputs
        firefox-addons
        rustToolChain
        pkgs-rust
        ;
    })
  ];

  home.packages = with pkgs; [ jq ];
  home.username = "moon";
  home.homeDirectory = "/home/moon";
  home.stateVersion = "25.11";
  home.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "zen";
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
