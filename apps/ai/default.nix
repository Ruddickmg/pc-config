{ pkgs-unstable, ... }:
{
  imports = [
    (import ./opencode.nix { inherit pkgs-unstable; })
  ];
}

