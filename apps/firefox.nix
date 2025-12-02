{ pkgs-unstable, firefox-addons, ... }:
let
  profile-name = "moon";
in
{
  programs.firefox = {
    enable = true;
    profiles."${profile-name}" = {
      id = 0;
      name = profile-name;
      isDefault = true;
      settings = {
        "extensions.autoDisableScopes" = 0;
        "browser.startup.homepage" = "https://searx.aicampground.com";
        "browser.compactmode.show" = true;
        "browser.search.defaultenginename" = "Searx";
        "browser.search.order.1" = "Searx";
      };
      search = {
        force = true;
        default = "searx";
        order = [
          "searx"
          "google"
        ];
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "''${pkgs-unstable.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "NixOS Wiki" = {
            urls = [ { template = "https://nixos.wiki/index.php?search={searchTerms}"; } ];
            icon = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@nw" ];
          };
          "Searx" = {
            urls = [ { template = "https://searx.aicampground.com/?q={searchTerms}"; } ];
            icon = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@searx" ];
          };
          "bing".metaData.hidden = true;
          "google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
        };
      };
      extensions = {
        force = true;
        packages = with firefox-addons; [
          firefox-color
          ublock-origin
          darkreader
          vimium
        ];
      };
    };
  };
  stylix.targets.firefox = {
    colorTheme.enable = true;
    enable = true;
    profileNames = [ profile-name ];
  };
}
