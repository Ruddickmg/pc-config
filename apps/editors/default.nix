{ pkgs-unstable, system, inputs, ... }: {
  imports = [
    (import ./neovim.nix { inherit inputs pkgs-unstable; })
    (import ./rustrover.nix { inherit pkgs-unstable inputs system; })
  ];
}
