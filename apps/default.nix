{ lib, pkgs, pkgs-unstable, system, inputs, config, ... }: {
  imports = [
    (import ./desktop { inherit pkgs pkgs-unstable; })
    (import ./media { inherit pkgs; })
    (import ./editors { inherit pkgs-unstable system inputs config; })
    (import ./terminal { inherit pkgs lib; })
    (import ./git.nix { inherit pkgs; })
    ./ssh.nix
    (import ./surf.nix { inherit pkgs; })
  ];
}