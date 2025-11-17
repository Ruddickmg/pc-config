{ ... }: {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    package = null;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [];
      input = {
        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          natural_scroll = "disabled";
          middle_emulation = "enabled";
        };
      };
    };
  };
}