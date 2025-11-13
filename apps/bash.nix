{ ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''eval "$(direnv hook bash)"'';
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };
}