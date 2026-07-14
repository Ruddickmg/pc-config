{ inputs, system, ... }:
{
  home.packages = [
    inputs.herdr.packages.${system}.default
  ];

  xdg.configFile."herdr/config.toml" = {
    force = true;
    text = ''
      onboarding = false

      [experimental]
      kitty_graphics = true

      [theme.custom]
      panel_bg = "reset"
    '';
  };
}
