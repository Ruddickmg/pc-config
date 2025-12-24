{
  lib,
  pkgs,
  pkgs-unstable,
  system,
  inputs,
  firefox-addons,
  rustToolChain,
  pkgs-rust,
  ...
}:
{
  imports = [
    (import ./ssh.nix { inherit lib; })
    (import ./lspmux.nix { inherit lib pkgs-rust rustToolChain; })
    (import ./desktop { inherit pkgs pkgs-unstable; })
    (import ./media { inherit pkgs; })
    (import ./editors { inherit pkgs-unstable system inputs; })
    (import ./terminal { inherit pkgs pkgs-unstable lib; })
    (import ./git.nix { inherit pkgs; })
    (import ./firefox.nix { inherit firefox-addons pkgs-unstable; })
  ];
}
