{ pkgs, ... }: {
  home.packages = with pkgs; [ shikane ];
  services.shikane = {
    enable = true;
#    settings = {
#      profile = [
#        {
#          name = "external-monitor-default";
#          output = [
#            {
#              match = "eDP-1";
#              enable = true;
#            }
#            {
#              match = "HDMI-A-1";
#              enable = true;
#              position = {
#                x = 1920;
#                y = 0;
#              };
#            }
#          ];
#        }
#        {
#          name = "builtin-monitor-only";
#          output = [
#            {
#              match = "eDP-1";
#              enable = true;
#            }
#          ];
#        }
#      ];
#    };
  };
}