{ pkgs, ... }:
#  let
#    laptop = "eDP-1";
#  in
{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    package = null;
    checkConfig = false;
    extraConfig = ''
      blur disable
      corner_radius 10

      shadows enable
      shadows_on_csd enable
      shadow_blur_radius 20
      shadow_color #0000007F

      for_window [app_id="^zen$"] opacity 0.95
    '';
    config = rec {
      #      bindswitches = {
      #        "lid:on" = {
      #          reload = true;
      #          locked = true;
      #          action = "output ${laptop} disable";
      #        };
      #        "lid:off" = {
      #          reload = true;
      #          locked = true;
      #          action = "output ${laptop} enable";
      #        };
      #      };
      assigns = {
        "1" = [ { class = "^zen$"; } ];
        "2" = [ { class = "jetbrains-rustrover"; } ];
      };
      defaultWorkspace = "workspace number 1";
      modifier = "Mod4";
      terminal = "ghostty";
      window.titlebar = false;
      bars = [ { command = "waybar"; } ];
      startup = [
        { command = "ghostty"; }
        { command = "systemctl --user restart awww-daemon && sleep 0.5 && ${pkgs.awww}/bin/awww img $HOME/Pictures/wallpaper.gif"; always = true; }
        #        { command = "firefox"; }
      ];
      keybindings = {
        "${modifier}+0" = "workspace number 10";
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+Down" = "focus down";
        "${modifier}+Left" = "focus left";
        "${modifier}+c" = "exec ghostty";
        "${modifier}+Right" = "focus right";
        "${modifier}+Shift+0" = "move container to workspace number 10";
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Ctrl+Down" = "move down";
        "${modifier}+Ctrl+Left" = "move left";
        "${modifier}+Ctrl+Right" = "move right";
        "${modifier}+Ctrl+Up" = "move up";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+e" =
          "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
        "${modifier}+Shift+h" = "workspace prev";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "workspace next";
        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+Up" = "focus up";
        "${modifier}+a" = "focus parent";
        "${modifier}+b" = "splith";
        "${modifier}+e" = "layout toggle split";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        "${modifier}+minus" = "scratchpad show";
        "${modifier}+r" = "mode resize";
        #        "${modifier}+s" = "layout stacking";
        "${modifier}+space" = "focus mode_toggle";
        "${modifier}+v" = "splitv";
        #        "${modifier}+w" = "layout tabbed";
        "${modifier}+d" = "exec fuzzel";
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Right" = "move right";
        "${modifier}+y" = "exec ghostty -e yazi";
        "${modifier}+m" = "exec ghostty -e btop";
      };
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
