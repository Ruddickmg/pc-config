{ pkgs, ... }:
{
  stylix = {
    targets = {
      yazi.enable = true;
      waybar.enable = true;
      sway.enable = true;
      gtk.enable = true;
    };
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-soft.yaml";
    image = ../../wallpapers/wallpaper-first-frame.png;
    opacity = {
      applications = 0.8;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.8;
    };
  };

  programs.waybar.style = ''
    * {
      font-family: "JetBrainsMono Nerd Font", sans-serif;
      font-size: 13pt;
      min-height: 0;
    }

    window#waybar {
      background-color: alpha(@base00, 0.90);
      color: @base05;
    }

    #workspaces button {
      padding: 0 8px;
      color: @base03;
      border-bottom: 3px solid transparent;
      min-width: 20px;
    }

    #workspaces button.focused,
    #workspaces button.active {
      color: @base05;
      border-bottom: 3px solid @base0D;
    }

    #workspaces button.urgent {
      color: @base00;
      background-color: @base08;
      border-bottom: 3px solid @base08;
    }

    #workspaces button:hover {
      background: alpha(@base02, 0.6);
    }

    #window {
      padding: 0 10px;
      color: @base04;
      font-style: italic;
    }

    #tray {
      padding: 0 8px;
      color: @base05;
    }

    #network {
      padding: 0 8px;
      color: @base0D;
    }

    #network.disconnected {
      color: @base08;
    }

    #bluetooth {
      padding: 0 8px;
      color: @base0D;
    }

    #bluetooth.disabled {
      color: @base03;
    }

    #pulseaudio {
      padding: 0 8px;
      color: @base0D;
    }

    #pulseaudio.muted {
      color: @base03;
    }

    #cpu {
      padding: 0 8px;
      color: @base0C;
    }

    #memory {
      padding: 0 8px;
      color: @base0C;
    }

    #backlight {
      padding: 0 8px;
      color: @base0A;
    }

    #battery {
      padding: 0 8px;
      color: @base0B;
    }

    #battery.charging {
      color: @base0B;
    }

    #battery.full {
      color: @base0B;
    }

    #battery.warning {
      color: @base0A;
    }

    #battery.critical {
      color: @base08;
    }

    #temperature {
      padding: 0 8px;
      color: @base0C;
    }

    #temperature.critical {
      color: @base08;
    }

    #clock {
      padding: 0 10px;
      color: @base05;
      font-weight: bold;
    }

    #custom-power {
      padding: 0 10px;
      color: @base08;
      font-size: 16pt;
    }

    #custom-power:hover {
      background-color: @base08;
      color: @base00;
    }
  '';
}
