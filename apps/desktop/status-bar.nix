{ pkgs, pkgs-unstable, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs-unstable.waybar;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        margin-top = 0;
        margin-bottom = 0;

        modules-left = [ "sway/workspaces" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "tray" "network" "bluetooth" "pulseaudio" "cpu" "memory" "temperature" "backlight" "battery" "clock" "custom/power" ];

        "sway/workspaces" = {
          format = "{name}";
          all-outputs = false;
          active-only = false;
        };

        "sway/window" = {
          max-length = 50;
        };

        "tray" = {
          spacing = 10;
        };

        "network" = {
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          format = "{icon}";
          format-wifi = "{icon}";
          format-ethernet = "<span size='11500'>󰈀</span>";
          format-disconnected = "<span size='11500'>󰤭</span>";
          format-linked = "<span size='11500'>󰈀</span>";
          tooltip-format-wifi = "{essid} ({signalStrength}%) 󰤨\n{ipaddr}/{cidr}";
          tooltip-format-ethernet = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format-disconnected = "Disconnected";
          interval = 3;
          on-click = "${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";
        };

        "bluetooth" = {
          format = "<span size='11500'>󰂯</span>";
          format-off = "<span size='11500'>󰂲</span>";
          format-disabled = "<span size='11500'>󰂲</span>";
          format-connected = "<span size='11500'>󰂱</span>";
          format-connected-battery = "<span size='11500'>󰂱</span> {device_battery_percentage}%";
          tooltip-format = "{num_connections} device connected\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
          on-click = "${pkgs.rofi-bluetooth}/bin/rofi-bluetooth";
        };

        "pulseaudio" = {
          format = "<span size='11500'>{icon}</span>";
          format-bluetooth = "<span size='11500'>{icon}</span>";
          format-bluetooth-muted = "<span size='11500'>󰝟</span>";
          format-muted = "<span size='11500'>󰝟</span>";
          format-source = "<span size='11500'>󰍬</span>";
          format-source-muted = "<span size='11500'>󰍭</span>";
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click-right = "${pkgs.pamixer}/bin/pamixer -t";
          scroll-step = 5;
          tooltip-format = "{volume}%\n{desc}";
          tooltip-format-source = "{source_volume}%\n{desc}";
        };

        "cpu" = {
          format = "<span size='11500'>󰍛</span> {usage}%";
          tooltip-format = "{usage}%";
          on-click = "ghostty -e btop";
        };

        "memory" = {
          format = "<span size='11500'>󰈀</span> {used:0.1f}GiB";
          tooltip-format = "{used:0.1f}GiB / {total:0.1f}GiB ({percentage}%)";
          on-click = "ghostty -e btop";
        };

        "backlight" = {
          format = "{icon}";
          format-icons = [ "󱩎" "󱩒" "󰖨" ];
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
        };

        "battery" = {
          states = {
            full = 100;
            charged = 95;
            charging = 50;
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "<span size='11500'>󰂄</span>";
          format-plugged = "<span size='11500'>󰂄</span>";
          format-full = "<span size='11500'>󰁹</span>";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          tooltip-format = "{timeTo}\n{capacity}%";
        };

        "temperature" = {
          critical-threshold = 80;
          format = "{temperatureF}°F";
          format-critical = "{temperatureC}°C";
          tooltip-format = "{temperatureF}°F";
        };

        "clock" = {
          format = "󰥔 {:%I:%M %p}";
          tooltip-format = "<tt>{calendar}</tt>";
        };

        "custom/power" = {
          format = "⏻";
          on-click = "wlogout";
          tooltip = false;
        };
      };
    };
  };
}
