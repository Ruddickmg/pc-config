{ pkgs, ... }: {
  imports = [
    ./window-manager.nix
    (import ./status-bar.nix { inherit pkgs; })
    (import ./app-launcher.nix { inherit pkgs; })
  ];
}