{ pkgs, lib, ... }: {
  imports = [
    (import ./monitor.nix { inherit pkgs; })
    (import ./starship.nix { inherit pkgs; })
    (import ./direnv.nix { inherit pkgs; })
    (import ./kitty.nix { inherit pkgs lib; })
    ./bash.nix
    ./yazi.nix
  ];
}