{ pkgs, ... }: {
  home.packages = with pkgs.yaziPlugins; [ piper ];
  programs.yazi = {
    enable = true;
    settings = {
      opener.play = [
        { run = "vlc $@"; desc = "Open in VLC"; orphan = true; for = "linux"; }
      ];
      manager = {
        ratio = [
          1
          4
          3
        ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };
      plugins = {
        prepend_previewers = [
          { name = "*.tar*"; run = ''piper --format=url -- tar tf "$1"''; }
          { name = "*/"; run = ''piper -- eza -TL=3 --color=always --icons=always --group-directories-first --no-quotes "$1"''; }
          { name = "*.md"; run = ''piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"''; }
        ];
        append_previewers = [
          { name = "*"; run = ''piper -- hexyl --border=none --terminal-width=$w "$1"''; }
        ];
      };
      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
        tab_size = 1;
        max_width = 1000;
        max_height = 1000;
        cache_dir = "";
        ueberzug_scale = 1;
        ueberzug_offset = [
          0
          0
          0
          0
        ];
      };

      tasks = {
        micro_workers = 5;
        macro_workers = 10;
        bizarre_retry = 5;
      };
    };
  };
}
