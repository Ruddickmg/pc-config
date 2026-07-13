{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      command = "herdr";
      font-family = "JetBrains Mono Nerd Font";
      font-size = 13;
      background-opacity = 0.85;
      background-blur = 20;
      window-padding-x = 10;
      window-padding-y = 10;
      audible-bell = false;
      confirm-close-surface = false;
      mouse-hide-while-typing = true;
      theme = "gruvbox-dark";
    };
  };
}
