{ pkgs, ... }:
{
  stylix = {
    targets = {
      yazi.enable = true;
      waybar.enable = false;
      sway.enable = false;
      gtk.enable = true;
      rofi.enable = false;
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
      font-family: "JetBrainsMono Nerd Font Propo", sans-serif;
      font-size: 13px;
      min-height: 0;
      border: none;
    }

    window#waybar {
      background-color: transparent;
      color: @base05;
    }

    /* ── Workspaces ────────────────────────────────────────────── */

    #workspaces {
      padding: 0 4px;
      margin: 3px 4px;
      border-radius: 10px;
      background-color: alpha(@base00, 0.8);
    }

    #workspaces button {
      padding: 0 8px;
      margin: 2px 1px;
      color: @base04;
      border-radius: 8px;
      min-width: 12px;
      transition: all 250ms ease;
    }

    #workspaces button:hover {
      background-color: alpha(@base05, 0.15);
      color: @base05;
    }

    #workspaces button.focused,
    #workspaces button.active {
      background-color: @base0D;
      color: @base00;
      font-weight: bold;
    }

    #workspaces button.urgent {
      background-color: @base08;
      color: @base00;
    }

    /* ── Window title ──────────────────────────────────────────── */

    #window {
      padding: 0 12px;
      color: @base04;
      font-style: italic;
    }

    /* ── Module group containers (pill groups) ─────────────────── */

    #tray,
    #network,
    #bluetooth,
    #pulseaudio,
    #cpu,
    #memory,
    #temperature,
    #backlight,
    #battery,
    #clock,
    #custom-power {
      padding: 0 10px;
      margin: 3px 1px;
      border-radius: 10px;
      background-color: alpha(@base00, 0.8);
    }

    /* ── Tray ──────────────────────────────────────────────────── */

    #tray {
      margin-left: 4px;
      padding: 0 8px;
    }

    #tray > .passive {
      -gtk-icon-effect: dim;
    }

    #tray > .needs-attention {
      -gtk-icon-effect: highlight;
    }

    /* ── Network ───────────────────────────────────────────────── */

    #network {
      color: @base0D;
    }

    #network.disconnected {
      color: @base08;
    }

    #network.linked {
      color: @base0A;
    }

    /* ── Bluetooth ─────────────────────────────────────────────── */

    #bluetooth {
      color: @base0D;
    }

    #bluetooth.disabled {
      color: @base03;
    }

    #bluetooth.connected {
      color: @base0B;
    }

    /* ── Pulseaudio ────────────────────────────────────────────── */

    #pulseaudio {
      color: @base0D;
      margin-right: 4px;
    }

    #pulseaudio.muted {
      color: @base03;
    }

    /* ── CPU ───────────────────────────────────────────────────── */

    #cpu {
      color: @base0C;
    }

    /* ── Memory ────────────────────────────────────────────────── */

    #memory {
      color: @base0C;
    }

    /* ── Temperature ───────────────────────────────────────────── */

    #temperature {
      color: @base0C;
      margin-right: 4px;
    }

    #temperature.critical {
      color: @base08;
    }

    /* ── Backlight ─────────────────────────────────────────────── */

    #backlight {
      color: @base0A;
    }

    /* ── Battery ───────────────────────────────────────────────── */

    #battery {
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

    /* ── Clock ─────────────────────────────────────────────────── */

    #clock {
      color: @base05;
      font-weight: bold;
      font-size: 13px;
      margin-right: 4px;
    }

    /* ── Power button ──────────────────────────────────────────── */

    #custom-power {
      color: @base08;
      font-size: 16px;
      margin-right: 4px;
      padding: 0 12px;
    }

    #custom-power:hover {
      background-color: @base08;
      color: @base00;
    }

    /* ── Tooltips ──────────────────────────────────────────────── */

    tooltip {
      background: @base00;
      border: 1px solid @base03;
      border-radius: 8px;
    }

    tooltip label {
      color: @base05;
    }
  '';
}
