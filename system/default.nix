{
  pkgs,
  nix-colors,
  ...
}:
{
  imports = [
    ./bluetooth.nix
    ./thunderbolt.nix
    # (import ./lspmux.nix { inherit pkgs config; })
    (import ./audio.nix { inherit pkgs; })
    (import ./network.nix { inherit pkgs; })
    (import ./stylix.nix { inherit pkgs nix-colors; })
    (import ./desktop.nix { inherit pkgs; })
    (import ./icons.nix { inherit pkgs; })
  ];
}
