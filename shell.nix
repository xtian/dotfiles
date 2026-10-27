{
  pkgs,
  primaryUser,
  ragenix,
  system,
  ...
}:
{
  environment = {
    shells = [ pkgs.fish ];

    systemPackages = [
      # Decrypts secrets with 1Password SSH keys
      (ragenix.packages.${system}.default.override { plugins = [ pkgs.age-plugin-1p ]; })
    ];

    shellAliases = {
      g = "git";
      ls = "eza";
      sw = "sudo darwin-rebuild switch";
      tree = "eza --tree";
    };

    systemPath = [
      "/opt/homebrew/bin"
      "$GHOSTTY_BIN_DIR"
      "'/Applications/Sublime Merge.app/Contents/SharedSupport/bin'"
    ];

    variables = {
      EDITOR = "nvim";
      PI_THEME = "gruvbox";
      PLUG_EDITOR = "zed://file/__FILE__:__LINE__";
      SSH_AUTH_SOCK = "/Users/${primaryUser}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
    };
  };

  programs._1password.enable = true;

  programs.fish.enable = true;

  users.knownUsers = [ primaryUser ];

  users.users."${primaryUser}" = {
    home = "/Users/${primaryUser}";
    shell = pkgs.fish;
    uid = 501;
  };
}
