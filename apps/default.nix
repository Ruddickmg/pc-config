{ lib, pkgs, pkgs-unstable, jetbrains-plugins, system, ... }: {
  imports = [
    ./yazi.nix
    ./starhip.nix
    (import ./neovim.nix { pkgs = pkgs; })
    (import ./git.nix { pkgs = pkgs; })
    (import ./kitty.nix { pkgs = pkgs; lib = lib; })
    (import ./rustrover.nix {
      pkgs-unstable = pkgs-unstable;
      jetbrains-plugins = jetbrains-plugins;
      system = system;
    })
  ];
}