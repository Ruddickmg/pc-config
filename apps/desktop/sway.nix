{ ... }: {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    package = null;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [];
    };
  };
}