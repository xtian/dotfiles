{ pkgs, ... }:
let
  zed-mix-format = pkgs.writeShellApplication {
    name = "zed-mix-format";
    runtimeInputs = [
      pkgs.beam29Packages.elixir_1_20
      pkgs.beam29Packages.erlang
      pkgs.coreutils
      pkgs.tailwindcss_4
    ];
    text = ''
      # Zed passes the absolute buffer path as $1 and buffer contents on stdin.
      buffer_path=''${1:?zed-mix-format: missing buffer path}

      dir=$(dirname -- "$buffer_path")
      while [ "$dir" != "/" ] && [ ! -e "$dir/mix.exs" ]; do
        dir=$(dirname -- "$dir")
      done

      # Not inside a mix project: pass stdin through untouched so the save is safe.
      if [ ! -e "$dir/mix.exs" ]; then
        exec cat
      fi

      cd "$dir"
      exec mix format --stdin-filename "$buffer_path" -
    '';
  };

  # The Nix oxfmt resolves `svelte/compiler` from its store path, so expose the projects' installs.
  # Zed starts language servers in the worktree root.
  zed-oxfmt = pkgs.writeShellApplication {
    name = "zed-oxfmt";
    runtimeInputs = [ pkgs.oxfmt ];
    text = ''
      node_path=""
      for dir in "$PWD/node_modules" "$PWD"/*/node_modules "$PWD"/*/assets/node_modules; do
        if [ -d "$dir/svelte" ]; then
          node_path="$node_path''${node_path:+:}$dir"
        fi
      done

      NODE_PATH=$node_path exec oxfmt "$@"
    '';
  };

  # Type-aware linting needs tsgolint on PATH, which GUI-launched Zed doesn't have
  zed-oxlint = pkgs.writeShellApplication {
    name = "zed-oxlint";
    runtimeInputs = [
      pkgs.oxlint
      pkgs.tsgolint
    ];
    text = ''
      exec oxlint "$@"
    '';
  };

  oxcFormatter = [
    { language_server.name = "oxfmt"; }
  ];

  oxcLanguage = {
    formatter = oxcFormatter;
    prettier.allowed = false;
  };

  # Apply oxlint's safe fixes before formatting, matching `oxlint --fix` + oxfmt in treefmt
  oxcLintedLanguage = oxcLanguage // {
    formatter = [ { code_action = "source.fixAll.oxc"; } ] ++ oxcFormatter;
  };
in
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
      "oxc"
      "solidity"
      "svelte"
    ];

    userSettings = {
      base_keymap = "SublimeText";
      buffer_font_family = "SF Mono Powerline";
      buffer_font_size = 15;
      cli_default_open_behavior = "new_window";
      cursor_blink = false;
      edit_predictions.mode = "subtle";
      format_on_save = "on";
      formatter = "language_server";
      preferred_line_length = 140;
      soft_wrap = "bounded";
      tab_size = 2;
      telemetry.metrics = false;
      ui_font_size = 16;
      vim_mode = true;

      languages = {
        CSS = oxcLanguage;
        Elixir = {
          formatter.external = {
            command = pkgs.lib.getExe zed-mix-format;
            arguments = [ "{buffer_path}" ];
          };
          language_servers = [
            "expert"
            "tailwindcss-language-server"
          ];
        };
        Fish.formatter.external = {
          command = pkgs.lib.getExe' pkgs.fish "fish_indent";
        };
        HTML = oxcLanguage;
        JavaScript = oxcLintedLanguage;
        JSON = oxcLanguage;
        JSONC = oxcLanguage;
        Markdown = oxcLanguage;
        Svelte = oxcLintedLanguage;
        TSX = oxcLintedLanguage;
        TypeScript = oxcLintedLanguage;
        YAML = oxcLanguage;
      };

      lsp = {
        expert = {
          binary = {
            path = pkgs.lib.getExe' pkgs.beam28Packages.expert "expert";
            arguments = [ "--stdio" ];
          };
        };

        nil = {
          settings = {
            formatting.command = [ (pkgs.lib.getExe pkgs.nixfmt) ];
            nix.flake.autoArchive = true;
          };
        };

        oxfmt.binary = {
          path = pkgs.lib.getExe zed-oxfmt;
          arguments = [ "--lsp" ];
        };

        oxlint = {
          binary = {
            path = pkgs.lib.getExe zed-oxlint;
            arguments = [ "--lsp" ];
          };
          initialization_options.settings = {
            fixKind = "safe_fix";
            typeAware = true;
          };
        };

        vscode-css-language-server = {
          settings.css.lint.unknownAtRules = "ignore";
        };
      };

      theme = {
        mode = "system";
        light = "Gruvbox Light";
        dark = "Gruvbox Dark";
      };
    };
  };

  home.shellAliases.zed = "/Applications/Zed.app/Contents/MacOS/cli";

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
