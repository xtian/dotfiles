{ hostName, primaryUser, ... }:
{
  networking.hostName = hostName;
  networking.computerName = hostName;

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
      FXPreferredViewStyle = "Nlsv"; # List view
      FXRemoveOldTrashItems = true;
      NewWindowTarget = "Home";
      ShowPathbar = true;
    };

    trackpad = {
      Clicking = true;
      TrackpadThreeFingerDrag = true;
    };

    CustomUserPreferences = {
      NSGlobalDomain = {
        WebKitDeveloperExtras = true;
      };
      "com.apple.Accessibility" = {
        FullKeyboardAccessFocusRingEnabled = 1;
      };
      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
      };
      "com.apple.Safari" = {
        PrivateBrowsingRequiresAuthentication = 1;
        PrivateSearchEngineUsesNormalSearchEngineToggle = 1;
        SearchProviderShortName = "DuckDuckGo";
      };
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
      "com.apple.screencapture" = {
        include-date = false;
        name = "screenshot";
        type = "PNG";
      };
      "com.colliderli.iina" = {
        arrowBtnAction = 2;
        playlistAutoPlayNext = 0;
      };
      "org.herf.Flux" = {
        lateColorTemp = 1200;
        nightColorTemp = 2700;
        wakeTime = 480; # 8:00 in minutes
      };
      "com.knollsoft.Rectangle" = {
        allowAnyShortcut = 1;
        alternateDefaultShortcuts = 1;
        launchOnLogin = 1;
        selectedCycleSizes = 23;
      };
      "org.m0k.transmission" = {
        AutoImport = 1;
        AutoImportDirectory = "/Users/${primaryUser}/Downloads";
        AutoSize = 1;
        DeleteOriginalTorrent = 1;
        DownloadFolder = "/Users/${primaryUser}/Downloads/Torrents";
        DownloadLocationConstant = 1;
        EncryptionRequire = 1;
        IncompleteDownloadFolder = "/Users/${primaryUser}/Downloads/Torrents";
        RandomPort = 1;
        SmallView = 1;
        UseIncompleteDownloadFolder = 1;
        WarningLegal = 0;
      };
    };

    NSGlobalDomain = {
      "com.apple.sound.beep.feedback" = 0;
      AppleInterfaceStyleSwitchesAutomatically = true;
      ApplePressAndHoldEnabled = false;
      _HIHideMenuBar = true;
    };

    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

    screencapture.disable-shadow = true;
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
