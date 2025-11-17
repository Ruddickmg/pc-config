{ pkgs, lib, ... }: {
  imports = [
    (import ./starship.nix { inherit pkgs; })
    (import ./direnv.nix { inherit pkgs; })
    (import ./kitty.nix { inherit pkgs lib; })
    ./bash.nix
    ./yazi.nix
  ];
}