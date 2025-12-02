{
  lib,
  pkgs,
  pkgs-unstable,
  system,
  inputs,
  firefox-addons,
  ...
}:
{
  imports = [
    ./ssh.nix
    (import ./desktop { inherit pkgs pkgs-unstable; })
    (import ./media { inherit pkgs; })
    (import ./editors { inherit pkgs-unstable system inputs; })
    (import ./terminal { inherit pkgs pkgs-unstable lib; })
    (import ./git.nix { inherit pkgs; })
    (import ./firefox.nix { inherit firefox-addons pkgs-unstable; })
  ];
}
