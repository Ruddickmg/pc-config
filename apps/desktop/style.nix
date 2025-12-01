{ pkgs, ... }: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-soft.yaml";
    image = pkgs.fetchurl {
      url = "https://images5.alphacoders.com/327/thumb-1920-327372.jpg";
      hash = "sha256-z6qxvihhtiaoeX2gCqqp659I1ygjm6bsWGL3TNYehp0=";
    };
    autoEnable = true;
    opacity = {
      applications = 0.8;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.8;
    };
  };
}
