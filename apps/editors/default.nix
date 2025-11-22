{ pkgs-unstable, system, inputs, config, ... }: {
  imports = [
    (import ./neovim.nix { inherit inputs config; })
    (import ./rustrover.nix { inherit pkgs-unstable inputs system; })
  ];
}