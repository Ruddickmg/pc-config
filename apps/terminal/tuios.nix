{ inputs, system, ... }:
{
  home.packages = [
    inputs.tuios.packages.${system}.default
  ];

  xdg.configFile."tuios/config.toml" = {
    force = true;
    text = ''
      [startup]
      daemon = true
      tiled = true

      [appearance]
      theme = "gruvbox_dark"
      zen_mode = "always"
      hide_window_buttons = true
      shared_borders = true
      dockbar_position = "hidden"

      [appearance.sidebar]
      enabled = false

      [appearance.scrollbar]
      style = "thin"

      [notifications.agent]
      sound = true

      [keybindings.global]
      command_palette = [ "ctrl+shift+p" ]

      [keybindings.prefix_mode]
      terminal_focus_left = [ "left", "h" ]
      terminal_focus_down = [ "down", "j" ]
      terminal_focus_up = [ "up", "k" ]
      terminal_focus_right = [ "right", "l" ]
      # j/k were taken by these; moved to their shifted variants
      prefix_jump_notif = [ "J" ]
      prefix_keybinds = [ "K" ]
    '';
  };
}
