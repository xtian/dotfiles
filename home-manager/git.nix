{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    delta.enable = true;
    maintenance.enable = true;

    aliases = {
      a = "add";
      aa = "add --all";
      aam = "commit --amend --all";
      amm = "commit --amend";
      ap = "add --all --patch";
      b = "branch";
      cam = "commit --all --message";
      cm = "commit --message";
      co = "checkout";
      cp = "cherry-pick";
      d = "diff --patch-with-stat";
      dc = "diff --cached --patch-with-stat";
      fp = "push --force-with-lease";
      l = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      lc = "local-commits";
      pop = "reset HEAD^";
      r = "rebase";
      ra = "rebase --abort";
      rc = "rebase --continue";
      ri = "rebase --interactive";
      rix = "rebase --interactive HEAD~10";
      rr = "reset --hard HEAD";
      s = "status --short --branch";
      sw = "switch";
    };

    extraConfig = {
      advice = {
        defaultBranchName = false;
      };
      branch = {
        autosetuprebase = "always";
      };
      color = {
        ui = "auto";
      };
      core = {
        autocrlf = "input";
        whitespace = "trailing-space,space-before-tab";
      };
      "credential \"https://github.com\"" = {
        helper = "!${pkgs.lib.getExe pkgs.gh} auth git-credential";
      };
      "credential \"https://gist.github.com\"" = {
        helper = "!${pkgs.lib.getExe pkgs.gh} auth git-credential";
      };
      diff = {
        algorithm = "patience";
      };
      fetch = {
        prune = true;
      };
      merge = {
        conflictstyle = "diff3";
      };
      pull = {
        rebase = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
    };

    ignores = [ ".DS_Store" ];

    userName = "Christian Wesselhoeft";
  };
}
