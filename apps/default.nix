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
    (import ./ai { inherit pkgs pkgs-unstable; })
    (import ./ssh.nix { inherit pkgs; })
    (import ./desktop { inherit pkgs pkgs-unstable; })
    (import ./media { inherit pkgs; })
    (import ./editors { inherit pkgs-unstable system inputs; })
    (import ./terminal { inherit pkgs pkgs-unstable lib inputs system; })
    (import ./git.nix { inherit pkgs; })
    (import ./zen.nix { inherit firefox-addons pkgs-unstable inputs; })
    (import ./deluge.nix { inherit pkgs; })
  ];
}
