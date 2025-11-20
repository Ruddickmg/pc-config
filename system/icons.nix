{ pkgs, ... }: {
  programs.gdk-pixbuf.modulePackages = with pkgs; [
    librsvg
  ];
}