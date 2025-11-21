{ pkgs-unstable, jetbrains-plugins, system, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  home.packages = with jetbrains-plugins.lib.${system}; [
    (buildIdeWithPlugins pkgs-unstable.jetbrains "rust-rover" [
      "Docker"
      "nix-idea"
#      "co.anbora.labs.direnv"
      "ru.adelf.idea.dotenv"
      "com.chrisrm.idea.MaterialThemeUI"
      "gruvbox-material-dark"
      "gruvbox-material-light"
      "org.mvnsearch.plugins.justPlugin"
    ])
  ];
}
