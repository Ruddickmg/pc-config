{ pkgs-unstable, firefox-addons, inputs, ... }:
let
  profile-name = "moon";
in
{
  imports = [ inputs.zen-browser.homeModules.default ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
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
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "@nw" ];
          };
          "Searx" = {
            urls = [ { template = "https://searx.aicampground.com/?q={searchTerms}"; } ];
            icon = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "@searx" ];
          };
          "bing".metaData.hidden = true;
          "google".metaData.alias = "@g";
        };
      };
      extensions = {
        force = true;
        packages = with firefox-addons; [
          ublock-origin
          darkreader
          vimium
        ];
      };
    };
  };
  stylix.targets.zen-browser = {
    enable = true;
    profileNames = [ profile-name ];
  };
}
