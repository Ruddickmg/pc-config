{ pkgs, pkgs-unstable, lib, ... }: {
  imports = [
    (import ./zsh.nix { inherit pkgs; })
    (import ./eza.nix { inherit pkgs; })
    (import ./monitor.nix { inherit pkgs; })
    (import ./fonts.nix { inherit pkgs-unstable; })
    (import ./starship.nix { inherit pkgs; })
    (import ./direnv.nix { inherit pkgs; })
    (import ./kitty.nix { inherit pkgs lib; })
    (import ./yazi.nix { inherit pkgs; })
    ./bash.nix
  ];
}
