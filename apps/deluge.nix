{ pkgs, ... }:
let
  hostId = "a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6";
  delugeConfVersion = builtins.toJSON { file = 1; format = 1; };
  ltconfig = pkgs.fetchurl {
    url = "https://github.com/zakkarry/deluge-ltconfig/releases/download/v2.1.1/ltConfig-v2.1.1.egg";
    sha256 = "0g71m5qzqil1ksx5bp4vqrh5yl46jp985693b63vhjzzp6bl3rcn";
  };
  deluge-wrapped = pkgs.symlinkJoin {
    name = "deluge-wrapped";
    paths = [ pkgs.deluge ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/deluge --set GDK_BACKEND x11
      wrapProgram $out/bin/deluge-gtk --set GDK_BACKEND x11
    '';
  };
in
{
  home.packages = [ deluge-wrapped ];

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

  xdg.configFile."deluge/plugins/ltConfig-v2.1.1.egg".source = ltconfig;
}
