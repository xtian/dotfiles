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
        devbox
        diff-so-fancy
        dotnet-sdk_6
        elixir_1_16
        eza
        fd
        ffmpeg
        fzf
        gh
        git
        git-extras
        gnugrep
        gnumake
        gnused
        go
        golangci-lint
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
        tart
        tealdeer
        tokei
        vim
        wget
        whois
        yarn
        yt-dlp
        zig
      ];

      homebrew = {
        enable = true;

        taps = ["homebrew/cask-fonts" "homebrew/cask-versions"];
        casks = [
          "1password"
          "affinity-designer"
          "affinity-photo"
          "affinity-publisher"
          "airflow"
          "alfred"
          "appcleaner"
          "corretto"
          "cyberduck"
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
          "orion"
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

        masApps = {
          "1Password for Safari" = 1569813296;
          "Kagi Search for Safari" = 1622835804;
          "Microsoft Remote Desktop" = 1295203466;
          "Wipr" = 1320666476;
        };
      };

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

      system.defaults = {
        dock = {
          autohide = true;
          show-recents = false;
          wvous-bl-corner = 2; # Mission Control
          wvous-tr-corner = 13; # Lock screen
        };

        finder = {
          AppleShowAllExtensions = true;
          FXEnableExtensionChangeWarning = false;
          ShowPathbar = true;
        };

        trackpad = {
          Clicking = true;
          TrackpadThreeFingerDrag = true;
        };

        NSGlobalDomain."com.apple.sound.beep.feedback" = 0;
        NSGlobalDomain.AppleInterfaceStyleSwitchesAutomatically = true;
        NSGlobalDomain.ApplePressAndHoldEnabled = false;
        NSGlobalDomain._HIHideMenuBar = true;

        SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

        screencapture.disable-shadow = true;
      };

      system.keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
      };

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
      nixpkgs.config.allowUnfree = true;
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
