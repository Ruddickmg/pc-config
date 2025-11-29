{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    kitty
  ];
  programs.kitty = lib.mkForce {
    enable = true;
    font.name = "JetBrainsMono Nerd Font"; # Set your desired font name
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;
      background_opacity = "0.85";
      background_blur = 20;
      symbol_map = let mappings = [
        "U+e000-U+e00a"
        "U+ea60-U+ebeb"
        "U+e0a0-U+e0c8"
        "U+e0ca"
        "U+e0cc-U+e0d4"
        "U+e200-U+e2a9"
        "U+e300-U+e3e3"
        "U+e5fa-U+e6b1"
        "U+e700-U+e7c5"
        "U+f000-U+f2e0"
        "U+f300-U+f372"
        "U+f400-U+f532"
        "U+f0001-U+f1af0"
      ];
      in
        (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font Mono";
    };
  };
}
