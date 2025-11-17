{ pkgs, ... }: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Amber";
      package = pkgs.vimix-icon-theme;
    };
  };
}