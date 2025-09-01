{ pkgs, primaryUser, ... }:
{
  environment = {
    shells = [ pkgs.fish ];

    shellAliases = {
      g = "git";
      sw = "sudo darwin-rebuild switch";
      tree = "eza --tree";
    };

    variables = {
      EDITOR = "nvim";
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
