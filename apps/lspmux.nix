{
  pkgs-rust,
  rustToolChain,
  lib,
  ...
}:
let
  toml = pkgs-rust.formats.toml { };
  socketPath = "/run/user/1000/lspmux/lspmux.sock";
  configPath = ".config/lspmux/config.toml";
  mode = "0660";
  user = "moon";
  group = user;
  packages = with pkgs-rust; [
    rustToolChain
    gcc
  ];
  path = lib.makeBinPath packages;
in
{
  home.file."${configPath}".source = toml.generate "config.toml" {
    listen = socketPath;
    connect = socketPath;
    log_filters = "debug";
  };

  home.packages = [
    pkgs-rust.lspmux
  ];

  systemd.user = {
    enable = true;

    sockets.lspmux = {
      Unit = {
        description = "Unix socket for the lspmux server";
      };
      Socket = {
        ListenStream = socketPath;
        SocketMode = mode;
        SocketUser = user;
        SocketGroup = group;
        Accept = false;
        Writeable = true;
      };
      Install = {
        WantedBy = [ "sockets.target" ];
      };
    };

    services.lspmux = {
      Unit = {
        Description = "LSP multiplex server";
        After = [ "lspmux.socket" ];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs-rust.lspmux}/bin/lspmux server";
        Environment = [ "PATH=${path}" ];
        StandardInput = "socket";
        StandardOutput = "socket";
        StandardError = "journal";
      };
      Install = {
        WantedBy = [ "multi-user.target" ];
      };
    };
  };
}
