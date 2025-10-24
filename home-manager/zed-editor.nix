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
      base_keymap = "SublimeText";
      buffer_font_family = "SF Mono Powerline";
      buffer_font_size = 15;
      cursor_blink = false;
      edit_predictions.mode = "subtle";
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
}
