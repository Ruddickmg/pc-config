{ pkgs, ... }: {
  home.packages = with pkgs; [ eza ];
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    colors = "always";
    icons = "always";
    git = true;
  };
}
