{ pkgs, ... }: {
  home.packages = with pkgs; [ wlogout ];

  xdg.configFile."wlogout/layout".text = ''
    {
      "label" : "Logout",
      "action" : "swaymsg exit",
      "text": "󰍃",
      "keybind" : "l"
    }
    {
      "label" : "Reboot",
      "action" : "systemctl reboot",
      "text": "󰜉",
      "keybind" : "r"
    }
    {
      "label" : "Shutdown",
      "action" : "systemctl poweroff",
      "text": "⏻",
      "keybind" : "s"
    }
  '';

  xdg.configFile."wlogout/style.css".text = ''
    * {
      background-image: none;
      font-family: "JetBrainsMono Nerd Font", sans-serif;
      font-size: 16px;
    }

    window {
      background-color: rgba(50, 48, 47, 0.95);
    }

    button {
      background-color: rgba(80, 78, 74, 0.9);
      border: 2px solid rgba(124, 111, 100, 0.5);
      border-radius: 15px;
      margin: 10px;
      padding: 20px 40px;
      color: #ddc7a1;
      min-width: 150px;
      min-height: 100px;
    }

    button:focus {
      outline: none;
    }

    button:hover {
      background-color: rgba(124, 111, 100, 0.5);
      border-color: rgba(189, 175, 147, 0.8);
      color: #fbf1c7;
    }

    button text {
      color: #ddc7a1;
      font-size: 40px;
    }

    button:hover text {
      color: #fbf1c7;
    }

    button label {
      font-size: 14px;
      color: #ddc7a1;
      margin-top: 5px;
    }

    button:hover label {
      color: #fbf1c7;
    }
  '';
}
