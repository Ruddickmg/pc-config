{ pkgs, pkgs-unstable, inputs, ... }:
let
  profile-name = "moon";
in
{
  imports = [ inputs.zen-browser.homeModules.default ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    policies = {
      ExtensionSettings = {
        "{b9db16a4-6edc-47ec-a1f4-b86292ed211d}" = {
          default_area = "toolbar";
        };
      };
    };
    profiles."${profile-name}" = {
      id = 0;
      name = profile-name;
      isDefault = true;
      userChrome = ''
        :root:not([inDOMFullscreen="true"]):not([chromehidden~="location"]):not([chromehidden~="toolbar"]) {
          & #tabbrowser-tabbox #tabbrowser-tabpanels .browserSidebarContainer {
            & browser[transparent="true"] {
              background: none !important;
            }
          }
        }
      '';
      settings = {
        "extensions.autoDisableScopes" = 0;
        "browser.startup.homepage" = "https://searx.aicampground.com";
        "browser.compactmode.show" = true;
        "browser.search.defaultenginename" = "Searx";
        "browser.search.order.1" = "Searx";
        "browser.tabs.allow_transparent_browser" = true;
        "zen.widget.linux.transparency" = true;
        "zen.theme.gradient" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
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
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          vimium
          transparent-zen
          video-downloadhelper
        ];
        settings = {
          "{b9db16a4-6edc-47ec-a1f4-b86292ed211d}" = {
            permissions = [
              "tabs"
              "downloads"
              "webRequest"
              "webNavigation"
              "scripting"
              "declarativeNetRequest"
              "storage"
              "notifications"
              "contextMenus"
              "unlimitedStorage"
              "*://*.youtube.com/*"
              "*://*.vimeo.com/*"
              "*://*.facebook.com/*"
              "*://*.instagram.com/*"
              "*://*.ok.ru/*"
              "*://*.m.ok.ru/*"
              "*://*.vk.com/*"
              "*://*.vk.ru/*"
              "*://*.vkvideo.ru/*"
              "*://live.vkvideo.ru/*"
              "*://*.canva.com/*"
              "*://*.iq.com/*"
              "*://*.twitcasting.tv/*"
              "*://*.bilibili.tv/*"
              "*://*.bilibili.com/*"
              "*://*.taiav.com/*"
              "*://*.osmosis.org/*"
              "*://*.kick.com/*"
              "*://*.chaturbate.com/*"
              "*://*.chaturbate.eu/*"
              "*://*.chaturbate.global/*"
              "https://downloadhelper.net/activate*"
              "https://app.downloadhelper.net/activate*"
              "https://v10.downloadhelper.net/activate*"
              "<all_urls>"
            ];
          };
        };
      };
    };
  };

  stylix.targets.zen-browser.enable = false;
}
