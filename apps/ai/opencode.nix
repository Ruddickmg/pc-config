
{ pkgs-unstable, ... }:

{
  home.packages = [ pkgs-unstable.opencode ];

  programs.opencode.settings = {
    autoshare = false;
    autoupdate = true;
    model = "opencode/big-pickle";
  };
}
