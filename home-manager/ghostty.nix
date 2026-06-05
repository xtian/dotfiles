{
  programs.ghostty = {
    enable = true;
    package = null;
    enableFishIntegration = true;
    settings = {
      font-family = "SF Mono Powerline";
      font-size = 15;
      keybind = "shift+enter=text:\\n";
      macos-titlebar-style = "transparent";
      shell-integration-features = "cursor,sudo,title,ssh-terminfo,ssh-env";
      theme = "dark:Gruvbox Dark,light:Gruvbox Light";
      window-height = 58;
      window-width = 120;
    };
  };
}
