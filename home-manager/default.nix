{ pkgs, primaryUser, ... }:
{
  imports = [
    ./ghostty.nix
    ./git.nix
    ./neovim.nix
    ./readline.nix
    ./zed-editor.nix
  ];

  home = {
    username = primaryUser;
    homeDirectory = "/Users/${primaryUser}";
    stateVersion = "25.05";

    file = {
      ".hammerspoon/init.lua" = {
        force = true;
        text = ''
          hs.hotkey.bind({"cmd"}, "E", function()
            hs.application.launchOrFocusByBundleID("com.apple.Safari")
          end)
        '';
      };
      ".hushlogin" = {
        force = true;
        text = "";
      };
      ".wgetrc" = {
        force = true;
        text = ''
          adjust_extension = on
          follow_ftp = on
          no_parent = on
          retry_connrefused = on
          robots = off
          server_response = on
          timeout = 60
          timestamping = on
          tries = 3
          trust_server_names = on
          user_agent = Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)
        '';
      };
    };

    packages = with pkgs; [
      beam28Packages.elixir_1_19
      claude-code
      coreutils
      deno
      fh
      gh
      git-extras
      lsof
      nil
      nixd
      nodejs-slim
      pnpm
      procs
      wget
      which
      whois
      yarn-berry
    ];
  };

  programs = {
    bat.enable = true;
    bun.enable = true;
    home-manager.enable = true;
    jq.enable = true;
    yt-dlp.enable = true;

    delta = {
      enable = true;
      enableGitIntegration = true;
    };

    eza = {
      enable = true;
      enableFishIntegration = true;
      git = true;
      icons = "auto";
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks."*" = {
        identityAgent = "'/Users/${primaryUser}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock'";
      };
    };

    tealdeer = {
      enable = true;
      enableAutoUpdates = true;
    };

    yazi = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
