{ pkgs-unstable, inputs, system, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  home.packages = with inputs.nix-jetbrains-plugins.lib.${system}; [
    (buildIdeWithPlugins pkgs-unstable.jetbrains "rust-rover" [
      "Docker"
      "nix-idea"
#      "co.anbora.labs.direnv"
      "ru.adelf.idea.dotenv"
      "com.chrisrm.idea.MaterialThemeUI"
      "gruvbox-material-dark"
      "gruvbox-material-light"
      "org.mvnsearch.plugins.justPlugin"
      "com.cppcxy.emmylua2.attach-debugger"
    ])
  ];
}
