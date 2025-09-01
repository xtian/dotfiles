{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };

    casks = [
      "1password"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "airflow"
      "alfred"
      "appcleaner"
      "claude"
      "cyberduck"
      "discord"
      "docker"
      "font-sf-mono-for-powerline"
      "firefox@developer-edition"
      "flux"
      "ghostty"
      "google-chrome@beta"
      "gpg-suite-no-mail"
      "iina"
      "imageoptim"
      "obsidian"
      "rectangle"
      "sublime-merge"
      "sublime-text"
      "the-unarchiver"
      "transmission"
      "vlc"
      "zed"
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      "Telegram" = 747648890;
      "Wipr 2" = 1662217862;
    };
  };
}
