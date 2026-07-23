{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    lazygit
    gnupg
    (writeShellScriptBin "gpg-batch" ''
      exec ${gnupg}/bin/gpg --batch --quiet "$@"
    '')
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Ruddickmg";
        email = "ruddickmg@gmail.com";
        signingKey = "343E322A4E3B4C82";
      };
      commit.gpgSign = true;
      gpg.format = "openpgp";
      gpg.program = "gpg-batch";
    };
  };

  programs.lazygit = {
    enable = true;
  };
}
