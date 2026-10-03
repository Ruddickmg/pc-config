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
    # model = "opencode/big-pickle";
    permission = {
      bash = {
        "git *" = "deny";
        "git status*" = "allow";
        "git log*" = "allow";
        "git diff*" = "allow";
        "git show*" = "allow";
        "git branch -v*" = "allow";
        "git branch --list*" = "allow";
        "git remote -v*" = "allow";
        "git remote --verbose*" = "allow";
        "git ls-files*" = "allow";
        "git rev-parse*" = "allow";
        "git describe*" = "allow";
        "git tag -l*" = "allow";
      };
    };
  };

  programs.opencode.tui.theme = "system";
}
