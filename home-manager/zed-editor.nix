{
  programs.zed-editor = {
    enable = true;
    package = null;

    extensions = [
      "dockerfile"
      "elixir"
      "fish"
      "git-firefly"
      "html"
      "log"
      "mermaid"
      "nix"
      "solidity"
      "svelte"
    ];

    userSettings = {
      auto_indent = false;
      base_keymap = "SublimeText";
      buffer_font_family = "SF Mono Powerline";
      buffer_font_size = 15;
      cursor_blink = false;
      edit_predictions.mode = "subtle";
      preferred_line_length = 140;
      soft_wrap = "bounded";
      tab_size = 2;
      telemetry.metrics = false;
      ui_font_size = 16;
      vim_mode = true;

      languages = {
        Elixir = {
          language_servers = [
            "expert"
            "tailwindcss-language-server"
          ];
        };
      };

      lsp = {
        expert = {
          binary = {
            path = "/Users/xtian/Projects/src/expert/apps/expert/_build/prod/rel/plain/bin/start_expert";
            arguments = [ "--stdio" ];
          };
        };

        nil = {
          settings.nix.flake.autoArchive = true;
        };

        vscode-css-language-server = {
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore";
              };
            };
          };
        };
      };

      theme = {
        mode = "system";
        light = "Gruvbox Light";
        dark = "Gruvbox Dark";
      };
    };
  };

  home.file = {
    ".config/zed/snippets/elixir.json" = {
      force = true;
      text = builtins.toJSON {
        "def" = {
          prefix = "def";
          body = [
            "def $1($2) do"
            "  $3"
            "end"
          ];
          description = "Defines a public function with the given name and body";
        };
        "defmodule" = {
          prefix = "defmod";
          body = [
            "defmodule $1 do"
            "  $2"
            "end"
          ];
          description = "Defines a module given by name with the given contents";
        };
        "defp" = {
          prefix = "defp";
          body = [
            "defp $1($2) do"
            "  $3"
            "end"
          ];
          description = "Defines a private function with the given name and body";
        };
        "IO.inspect" = {
          prefix = "ii";
          body = [ "IO.inspect($1)" ];
          description = "Inspects item according to the given options using the IO device";
        };
      };
    };
  };
}
