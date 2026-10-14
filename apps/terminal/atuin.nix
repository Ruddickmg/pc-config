{ ... }: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      search_mode = "fuzzy";
      preferred_version = "v2";
    };
  };
}
