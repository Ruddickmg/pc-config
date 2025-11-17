{ pkgs, ... }: {
  imports = [
    ./sway.nix
    (import ./yambar.nix { inherit pkgs; })
  ];
}