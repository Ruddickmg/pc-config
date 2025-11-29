{ pkgs, pkgs-unstable, lib, ... }: {
  imports = [
    (import ./monitor.nix { inherit pkgs; })
    (import ./fonts.nix { inherit pkgs-unstable; })
    (import ./starship.nix { inherit pkgs; })
    (import ./direnv.nix { inherit pkgs; })
    (import ./kitty.nix { inherit pkgs lib; })
    ./bash.nix
    ./yazi.nix
  ];
}
