{
  programs.zed-editor = {
    enable = true;
    package = null;

    extensions = [
      "elixir"
      "nix"
    ];

    userSettings = {
      base_keymap = "SublimeText";
      buffer_font_family = "SF Mono Powerline";
      buffer_font_size = 15;
      cursor_blink = false;
      telemetry.metrics = false;
      ui_font_size = 16;
      vim_mode = true;

      theme = {
        mode = "system";
        light = "Gruvbox Light";
        dark = "Gruvbox Dark";
      };
    };
  };
}
