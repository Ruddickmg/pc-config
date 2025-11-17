{ pkgs, nix-colors, ... }: {
  imports = [
    ./bluetooth.nix
    ./thunderbolt.nix
    (import ./stylix.nix { inherit pkgs nix-colors; })
    (import ./desktop.nix { inherit pkgs; })
  ];
}