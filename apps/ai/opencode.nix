{ pkgs-unstable, ... }:

{
  stylix.targets.opencode.enable = false;

  programs.opencode = {
    enable = true;
    package = pkgs-unstable.opencode;
  };

  programs.opencode.settings = {
    autoshare = false;
    autoupdate = true;
    model = "opencode/big-pickle";
  };

  programs.opencode.tui.theme = "system";
}
