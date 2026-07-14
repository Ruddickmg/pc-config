{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      command = "herdr";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;
      background-opacity = 0.85;
      background-blur = 1;
      window-padding-x = 10;
      window-padding-y = 10;
      confirm-close-surface = false;
      mouse-hide-while-typing = true;
      theme = "Gruvbox Dark";
    };
  };
}
