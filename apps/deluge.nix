{ pkgs, ... }:
let
  hostId = "a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6";
  delugeConfVersion = builtins.toJSON { file = 1; format = 1; };
in
{
  home.packages = [ pkgs.deluge ];

  xdg.configFile."deluge/auth" = {
    force = true;
    text = "localclient:localclient:10\nruddickmg:deluge:10\n";
  };

  xdg.configFile."deluge/hostlist.conf".text = delugeConfVersion + builtins.toJSON {
    hosts = [[ hostId "media-server" 58846 "ruddickmg" "deluge" ]];
  };

  xdg.configFile."deluge/gtkui.conf".text = delugeConfVersion + builtins.toJSON {
    classic_mode = false;
    autoconnect = true;
    autoconnect_host_id = hostId;
    show_connection_manager_on_start = false;
  };
}
