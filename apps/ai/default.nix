{ pkgs-unstable, ... }:
{
  imports = [
    (import ./opencode.nix { inherit pkgs-unstable; })
    (import ./copilot.nix { inherit pkgs-unstable; })
  ];
}

