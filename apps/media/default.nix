{ pkgs, ... }: {
  imports = [
    (import ./images.nix { inherit pkgs; })
    (import ./video.nix { inherit pkgs; })
  ];
}