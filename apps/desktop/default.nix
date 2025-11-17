{ pkgs, ... }: {
  imports = [
    ./window-manager.nix
    (import ./monitors.nix { inherit pkgs; })
    (import ./status-bar.nix { inherit pkgs; })
    (import ./app-launcher.nix { inherit pkgs; })
  ];
}