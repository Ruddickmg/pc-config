{ pkgs, pkgs-unstable, ... }: {
  imports = [
    ./window-manager.nix
    (import ./icons.nix { inherit pkgs; })
    (import ./style.nix { inherit pkgs; })
    (import ./monitors.nix { inherit pkgs; })
    (import ./app-launcher.nix { inherit pkgs; })
    (import ./status-bar.nix { inherit pkgs-unstable; })
    (import ./wallpaper.nix { inherit pkgs-unstable; })
  ];
}