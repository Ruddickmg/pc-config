{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "${pkgs.ghostty}/bin/ghostty";
    extraConfig = {
      show-icons = true;
      icon-theme = "Papirus";
      modi = "drun,run,window,ssh";
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
    };
  };

  home.packages = with pkgs; [
    networkmanager_dmenu
    rofi-bluetooth
  ];

  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = ${pkgs.rofi}/bin/rofi -dmenu -i -theme ${./themes/wifi-dropdown.rasi}
    highlight = True
    prompt = Networks

    [editor]
    terminal = ${pkgs.ghostty}/bin/ghostty
    gui_if_available = True

    [nm-applet]
    notify = True
  '';

  xdg.configFile."rofi-bluetooth/config".text = ''
    theme=${./themes/bluetooth-dropdown.rasi}
  '';
}
