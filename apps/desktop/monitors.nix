{ pkgs, ... }: {
  home.packages = with pkgs; [ shikane ];
  services.shikane = {
    enable = true;
    settings = {
      profile = [
        {
          name = "office";
          output = [
            {
              match = "eDP-1";
              enable = false;
            }
            {
              match = "DP-2";
              enable = true;
              position = {
                x = 1920;
                y = 0;
              };
            }
            {
              match = "DP-3";
              enable = true;
              position = {
                x = 0;
                y = 0;
              };
            }
          ];
        }
        {
          name = "laptop";
          output = [
            {
              match = "eDP-1";
              enable = true;
            }
          ];
        }
      ];
    };
  };
}