{ pkgs, pkgs-unstable, inputs, system, ... }: {
  imports = [
    (import ./halloy.nix { inherit pkgs; })
    (import ./zoxide.nix { inherit pkgs; })
    (import ./zsh.nix { inherit pkgs; })
    (import ./eza.nix { inherit pkgs; })
    (import ./monitor.nix { inherit pkgs; })
    (import ./fonts.nix { inherit pkgs-unstable; })
    (import ./starship.nix { inherit pkgs; })
    (import ./direnv.nix { inherit pkgs; })
    (import ./ghostty.nix { inherit pkgs; })
    ./yazi.nix
    (import ./herdr.nix { inherit inputs system; })
    (import ./tuios.nix { inherit inputs system; })
    (import ./atuin.nix { })
    ./bash.nix
  ];
}
