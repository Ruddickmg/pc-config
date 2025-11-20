{ pkgs-unstable, ... }: {
   programs.waybar = {
     enable = true;
     package = pkgs-unstable.waybar;
   };
}