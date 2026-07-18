{ inputs, system, ... }:
{
  home.packages = [
    inputs.herdr.packages.${system}.default
  ];

  xdg.configFile."herdr/config.toml" = {
    force = true;
    text = ''
      onboarding = false

      [keys]
      next_workspace = "prefix+shift+j"
      previous_workspace = "prefix+shift+k"

      [ui]
      hide_tab_bar_when_single_tab = true

      [experimental]
      kitty_graphics = true

      [theme]
      name = "terminal"

      [theme.custom]
      panel_bg = "reset"
    '';
  };
}
