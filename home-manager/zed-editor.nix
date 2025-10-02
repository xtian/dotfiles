{
  programs.zed-editor = {
    enable = true;
    package = null;

    extensions = [
      "elixir"
      "fish"
      "html"
      "log"
      "nix"
      "solidity"
      "svelte"
    ];

    userKeymaps = [
      {
        context = "(Editor && mode == full)";
        bindings = {
          cmd-e = null;
        };
      }
    ];

    userSettings = {
      base_keymap = "SublimeText";
      buffer_font_family = "SF Mono Powerline";
      buffer_font_size = 15;
      cursor_blink = false;
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
      };

      theme = {
        mode = "system";
        light = "Gruvbox Light";
        dark = "Gruvbox Dark";
      };
    };
  };
}
