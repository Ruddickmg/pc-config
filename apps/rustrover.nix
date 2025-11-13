{ pkgs-unstable, jetbrains-plugins, system, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  home.packages = with jetbrains-plugins.lib.${system}; [
    (buildIdeWithPlugins pkgs-unstable.jetbrains "rust-rover" [
      "Docker"
      "nix-idea"
      "com.chrisrm.idea.MaterialThemeUI"
      "co.anbora.labs.direnv"
    ])
  ];
}
