{
  description = "";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
  }: let
    configuration = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        alejandra
        bat
        coreutils
        diff-so-fancy
        dotnet-sdk_8
        elixir
        eza
        fd
        ffmpeg
        fzf
        gh
        git
        git-extras
        go
        gnugrep
        gnumake
        gnused
        gzip
        hyperfine
        jq
        less
        llvm
        lsof
        nodejs
        postgresql
        procs
        ripgrep
        rsync
        sd
        tealdeer
        tokei
        vim
        wget
        whois
        yt-dlp
        zig
      ];

      homebrew.enable = true;
      homebrew.taps = ["homebrew/cask-fonts" "homebrew/cask-versions"];
      homebrew.casks = [
        "1password"
        "affinity-designer"
        "affinity-photo"
        "affinity-publisher"
        "airflow"
        "alfred"
        "appcleaner"
        "corretto"
        "discord"
        "docker"
        "font-sf-mono-for-powerline"
        "firefox-developer-edition"
        "flux"
        "google-chrome-beta"
        "gpg-suite-no-mail"
        "imageoptim"
        "iterm2"
        "microsoft-teams"
        "pgadmin4"
        "rectangle"
        "slack"
        "spotify"
        "sublime-merge"
        "sublime-text"
        "the-unarchiver"
        "vlc"
        "zed"
        "zoom"
      ];

      environment.shellAliases = {
        gc = "nix-collect-garbage -d";
        sw = "darwin-rebuild switch --flake ~/.config/nix-darwin";
      };

      environment.variables = {
        EDITOR = "vim";

        # Enable history for iex
        ERL_AFLAGS = "-kernel shell_history enabled";

        # Omit duplicates and commands that begin with a space from history.
        HISTCONTROL = "ignoreboth";

        # Prefer US English and use UTF-8
        LANG = "en_US";
        LC_ALL = "en_US.UTF-8";
      };

      system.defaults.NSGlobalDomain."com.apple.sound.beep.feedback" = 0;
      system.defaults.NSGlobalDomain.AppleInterfaceStyleSwitchesAutomatically = true;
      system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
      system.defaults.NSGlobalDomain._HIHideMenuBar = true;
      system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      system.defaults.screencapture.disable-shadow = true;

      system.defaults.dock.autohide = true;
      system.defaults.dock.wvous-bl-corner = 2; # Mission Control
      system.defaults.dock.wvous-tr-corner = 13; # Lock screen

      system.defaults.NSGlobalDomain."com.apple.mouse.tapBehavior" = 1; # Tap to click
      system.defaults.trackpad.TrackpadThreeFingerDrag = true;

      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToControl = true;

      security.pam.enableSudoTouchIdAuth = true;

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      nix.package = pkgs.nix;

      nix.settings = {
        # Necessary for using flakes on this system.
        experimental-features = "nix-command flakes repl-flake";
        build-users-group = "nixbld";
        max-jobs = "auto";
        extra-nix-path = "nixpkgs=flake:nixpkgs";
      };

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true; # default shell on catalina

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#xtian-mbp
    darwinConfigurations."xtian-mbp" = nix-darwin.lib.darwinSystem {
      modules = [configuration];
    };

    darwinConfigurations."FWM-20513" = nix-darwin.lib.darwinSystem {
      modules = [configuration];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."xtian-mbp".pkgs;
  };
}
