{ pkgs, ... }: {
  home.packages = with pkgs; [ btop ];
  programs.btop = {
    enable = true;
    settings = {
#      color_theme = "default";
      update_ms = 2000;
      show_detailed_cpu = true;
    };
#    themes = {
#      my-custom-theme = ''
#        # My custom btop theme
#        theme_background="transparent"
#        theme_text="white"
#        theme_cpu_box="blue"
#      '';
#    };
#    extraConfig = ''
#      # Additional custom settings
#      log_level = 0
#    '';
  };
}