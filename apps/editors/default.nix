{ pkgs-unstable, jetbrains-plugins, system, ... }: {
  imports = [
    ./neovim.nix
    (import ./rustrover.nix { inherit pkgs-unstable jetbrains-plugins system; })
  ];
}