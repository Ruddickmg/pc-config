{ pkgs, nix-colors, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = nix-colors.colorSchemes.monokai.palette;
    image = pkgs.fetchurl {
      url = "https://images5.alphacoders.com/327/thumb-1920-327372.jpg";
      hash = "sha256-z6qxvihhtiaoeX2gCqqp659I1ygjm6bsWGL3TNYehp0=";
    };
  };
}