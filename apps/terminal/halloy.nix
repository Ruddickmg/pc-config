{ pkgs, ... }:

{
  programs.halloy = {
    enable = true;
    settings = {
      servers = {
        p2pnet = {
          nickname = "Mo0nMasTer";
          server = "irc.p2p-network.net";
          port = 6697;
          use_tls = true;
          channels = [ "#peergarden" ];
        };
      };
    };
  };
}
