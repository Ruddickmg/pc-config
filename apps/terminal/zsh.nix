{ pkgs, ... }: {
  home.packages = with pkgs; [ zsh ];
  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
      strategy = [ "completion" "match_prev_cmd" ];
    };
    syntaxHighlighting.enable = true;
    dirHashes = {
      btp = "/var/www/bythepeoples/";
      projects = "/var/www";
    };
    envExtra = ''
      function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d \'\' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
      }
    '';
    initContent = ''
      (( $+commands[wt] )) && eval "$(wt config shell init zsh)"
    '';
  };
}
