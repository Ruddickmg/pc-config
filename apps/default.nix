{ lib, pkgs, pkgs-unstable, jetbrains-plugins, system, ... }: {
  imports = [
    (import ./desktop { inherit pkgs pkgs-unstable; })
    (import ./media { inherit pkgs; })
    (import ./editors { inherit pkgs-unstable jetbrains-plugins system; })
    (import ./terminal { inherit pkgs lib; })
    (import ./git.nix { inherit pkgs; })
    ./ssh.nix
    (import ./surf.nix { inherit pkgs; })
  ];
}