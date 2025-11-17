{ pkgs, ... }: {
   home.packages = with pkgs; [ yambar ];
   programs.yambar = {
     enable = true;
   };
}