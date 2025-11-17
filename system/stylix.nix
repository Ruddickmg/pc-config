{ pkgs, nix-colors, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = nix-colors.colorSchemes.monokai.palette;
  };
}