{ hostName, primaryUser, ... }:
{
  networking = {
    inherit hostName;
    computerName = hostName;

    applicationFirewall = {
      enable = true;
      enableStealthMode = true;
      allowSigned = true;
      allowSignedApp = true;
    };
  };

  system.activationScripts.extraActivation.text = ''
    softwareupdate --install-rosetta --agree-to-license
  '';

  system.activationScripts.postActivation.text = ''
    echo "trusted-users = root @admin ${primaryUser}" > /etc/nix/nix.custom.conf
  '';

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      wvous-bl-corner = 2; # Mission Control
      wvous-br-corner = 11; # Apps
      wvous-tr-corner = 13; # Lock screen
    };

    finder = {
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
        AppleKeyboardUIMode = 2;
        AppleMenuBarVisibleInFullscreen = 0;
        WebKitDeveloperExtras = true;
      };
      "com.apple.Accessibility" = {
        FullKeyboardAccessFocusRingEnabled = 1;
      };
      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
      };
      "com.apple.Mail" = {
        ConversationViewSortDescending = 1;
      };
      "com.apple.Safari" = {
        IncludeDevelopMenu = 1;
        PrivateBrowsingRequiresAuthentication = 1;
        PrivateSearchEngineUsesNormalSearchEngineToggle = 1;
        ReadingListSaveArticlesOfflineAutomatically = 1;
        SearchProviderShortName = "DuckDuckGo";
        ShowFullURLInSmartSearchField = 1;
        ShowOverlayStatusBar = 1;
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
        CheckQuit = 0;
        CheckRemoveDownloading = 1;
        DeleteOriginalTorrent = 1;
        DownloadFolder = "/Users/${primaryUser}/Downloads/Torrents";
        DownloadLocationConstant = 1;
        EncryptionRequire = 1;
        IncompleteDownloadFolder = "/Users/${primaryUser}/Downloads/Torrents";
        RandomPort = 1;
        SmallView = 1;
        UseIncompleteDownloadFolder = 1;
        WarningDonate = 0;
        WarningLegal = 0;
      };
    };

    NSGlobalDomain = {
      "com.apple.sound.beep.feedback" = 0;
      AppleInterfaceStyleSwitchesAutomatically = true;
      ApplePressAndHoldEnabled = false;
      _HIHideMenuBar = false;
    };

    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

    screencapture.disable-shadow = true;
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  launchd.daemons.limit-maxfiles = {
    serviceConfig = {
      Label = "limit.maxfiles";
      ProgramArguments = [
        "launchctl"
        "limit"
        "maxfiles"
        "524288"
        "524288"
      ];
      RunAtLoad = true;
    };
  };
}
