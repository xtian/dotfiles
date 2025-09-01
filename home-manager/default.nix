{ pkgs, primaryUser, ... }:
{
  imports = [
    ./ghostty.nix
    ./git.nix
    ./neovim.nix
    ./readline.nix
    ./zed-editor.nix
    ./extra.nix
  ];

  home = {
    username = primaryUser;
    homeDirectory = "/Users/${primaryUser}";
    stateVersion = "25.05";

    file = {
      ".hushlogin".text = "";
    };

    packages = with pkgs; [
      coreutils
      deno
      gh
      git-extras
      lsof
      nil
      nixd
      procs
      wget
      which
      whois
    ];
  };

  programs = {
    bat.enable = true;
    bun.enable = true;
    home-manager.enable = true;
    jq.enable = true;
    yt-dlp.enable = true;

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
        identityAgent = "'~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock'";
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
