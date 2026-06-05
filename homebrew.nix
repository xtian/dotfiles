{
  lib,
  primaryUser,
  ...
}:
let
  brewTrust = builtins.toJSON {
    trustedtaps = [ "yvgude/lean-ctx" ];
  };
in
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    taps = [
      "yvgude/lean-ctx"
    ];

    brews = [
      "lean-ctx"
    ];

    casks = [
      "1password"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "airflow"
      "android-studio"
      "appcleaner"
      "claude"
      "cyberduck"
      "discord"
      "docker-desktop"
      "figma"
      "firefox@developer-edition"
      "flux-app"
      "font-sf-mono-for-powerline"
      "gg"
      "ghostty"
      "google-chrome@beta"
      "hammerspoon"
      "iina"
      "imageoptim"
      "obsidian"
      "rectangle"
      "sublime-merge"
      "sublime-text"
      "telegram"
      "the-unarchiver"
      "transmission"
      "vlc"
      "zed"
    ];

    # masApps = {
    #   "1Password for Safari" = 1569813296;
    #   "Obsidian Web Clipper" = 6720708363;
    #   "Wipr 2" = 1662217862;
    # };
  };

  system.activationScripts.extraActivation.text = lib.mkBefore ''
    mkdir -p "/Users/${primaryUser}/.homebrew"
    cat > "/Users/${primaryUser}/.homebrew/trust.json" <<'TRUST'
    ${brewTrust}
    TRUST
    chown "${primaryUser}:staff" "/Users/${primaryUser}/.homebrew/trust.json"
    chmod 644 "/Users/${primaryUser}/.homebrew/trust.json"
  '';
}
