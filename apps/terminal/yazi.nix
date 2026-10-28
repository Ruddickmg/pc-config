{ pkgs, ... }: {
  home.packages = [ pkgs.glow ];
  programs.yazi = {
    enable = true;
    shellWrapperName = "yy";
    extraPackages = [ pkgs.fzf ];
    plugins = {
      piper = pkgs.yaziPlugins.piper;
      mount = pkgs.fetchFromGitHub {
        owner = "PHONE1X";
        repo = "lsblk-mount.yazi";
        rev = "master";
        hash = "sha256-HjIDBe2lG9w+tRalfdYIwOK2kRuVPFDPq37HqEdM7UQ=";
      };
      whoosh = {
        package = pkgs.fetchFromGitHub {
          owner = "WhoSowSee";
          repo = "whoosh.yazi";
          rev = "d6ede9895a0e14b1bb1d65cd0eb783f92f2fc522";
          hash = "sha256-LwugSeuG3+PmPW9KFvRThqx+g792CmUnw+vY6wSZJoo=";
        };
        setup = true;
        settings = {
          bookmarks = [
            {
              tag = "Nixos";
              path = "~/Nixos";
              key = "n";
            }
            {
              tag = "Projects";
              path = "/var/www";
              key = "p";
            }
            {
              tag = "Nvim";
              path = "~/.config/nvim";
              key = "v";
            }
            {
              tag = "Downloads";
              path = "~/Downloads";
              key = "o";
            }
            {
              tag = "Ubuntu";
              path = "/run/media/moon/4e47e3ee-f1ba-43ad-8805-bf04119ca88e/home/grant";
              key = "u";
            }
          ];
          jump_notify = false;
          path_truncate_enabled = true;
          path_max_depth = 3;
        };
      };
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = "M";
          run = "plugin mount";
          desc = "Mount partitions";
        }
        {
          on = "[";
          run = "plugin whoosh jump_by_key";
          desc = "Jump bookmark by key";
        }
        {
          on = "}";
          run = "plugin whoosh jump_by_fzf";
          desc = "Fuzzy search bookmarks";
        }
        {
          on = [ "]" "a" ];
          run = "plugin whoosh save";
          desc = "Bookmark hovered file/dir";
        }
        {
          on = [ "]" "A" ];
          run = "plugin whoosh save_cwd";
          desc = "Bookmark current directory";
        }
        {
          on = [ "]" "t" ];
          run = "plugin whoosh save_temp";
          desc = "Temp bookmark hovered file/dir";
        }
        {
          on = [ "]" "T" ];
          run = "plugin whoosh save_cwd_temp";
          desc = "Temp bookmark current directory";
        }
        {
          on = [ "]" "f" ];
          run = "plugin whoosh jump_by_fzf";
          desc = "Jump bookmark by fzf";
        }
        {
          on = [ "]" "d" ];
          run = "plugin whoosh delete_by_key";
          desc = "Delete bookmark by key";
        }
        {
          on = [ "]" "D" ];
          run = "plugin whoosh delete_by_fzf";
          desc = "Delete bookmarks by fzf";
        }
        {
          on = [ "]" "C" ];
          run = "plugin whoosh delete_all";
          desc = "Delete all user bookmarks";
        }
        {
          on = [ "]" "r" ];
          run = "plugin whoosh rename_by_key";
          desc = "Rename bookmark by key";
        }
        {
          on = [ "]" "R" ];
          run = "plugin whoosh rename_by_fzf";
          desc = "Rename bookmark by fzf";
        }
      ];
    };
    settings = {
      opener.play = [
        {
          run = "vlc \"$@\"";
          desc = "Open in VLC";
          orphan = true;
          for = "linux";
        }
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
      plugin = {
        prepend_previewers = [
          {
            url = "*.tar*";
            run = ''piper --format=url -- tar tf "$1"'';
          }
          {
            url = "*/";
            run = ''piper -- eza -TL=3 --color=always --icons=always --group-directories-first --no-quotes "$1"'';
          }
          {
            url = "*.md";
            run = ''piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'';
          }
        ];
        append_previewers = [
          {
            url = "*";
            run = ''piper -- hexyl --border=none --terminal-width=$w "$1"'';
          }
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
