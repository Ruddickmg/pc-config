{ pkgs, ... }: {
  home.packages = with pkgs; [ starship ];
  programs.starship = {
    enable = true;
    settings = {
      scan_timeout = 100;
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };
}
