{ pkgs, ... }: {
  home = {
    packages = with pkgs; [ zoxide ];
    shellAliases = { cd = "z"; };
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
