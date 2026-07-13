{ pkgs, pkgs-unstable, lib, inputs, system, ... }: {
  imports = [
    (import ./zoxide.nix { inherit pkgs; })
    (import ./zsh.nix { inherit pkgs; })
    (import ./eza.nix { inherit pkgs; })
    (import ./monitor.nix { inherit pkgs; })
    (import ./fonts.nix { inherit pkgs-unstable; })
    (import ./starship.nix { inherit pkgs; })
    (import ./direnv.nix { inherit pkgs; })
    (import ./kitty.nix { inherit pkgs lib; })
    (import ./yazi.nix { inherit pkgs; })
    (import ./herdr.nix { inherit inputs system; })
    ./bash.nix
  ];
}
