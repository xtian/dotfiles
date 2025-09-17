{ pkgs, primaryUser, ... }:
{
  environment = {
    shells = [ pkgs.fish ];

    shellAliases = {
      g = "git";
      sw = "sudo darwin-rebuild switch";
      tree = "eza --tree";
    };

    systemPath = [
      "$GHOSTTY_BIN_DIR"
      "'/Applications/Sublime Merge.app/Contents/SharedSupport/bin'"
    ];

    variables = {
      EDITOR = "nvim";
      SSH_AUTH_SOCK = "/Users/${primaryUser}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
    };
  };

  programs._1password.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_config prompt choose informative_vcs
    '';
  };

  users.users."${primaryUser}" = {
    home = "/Users/${primaryUser}";
    shell = pkgs.fish;
  };
}
