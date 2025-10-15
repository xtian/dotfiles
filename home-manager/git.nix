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
      commit = {
        gpgsign = true;
      };
      core = {
        autocrlf = "input";
        whitespace = "trailing-space,space-before-tab";
      };
      diff = {
        algorithm = "patience";
      };
      fetch = {
        prune = true;
      };
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
      merge = {
        conflictstyle = "diff3";
      };
      pull = {
        rebase = true;
      };
      push = {
        autoSetupRemote = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      user = {
        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDT1aGe2zFzfTwhsZrgmRrcews9wekhMrRLIqRJ14+J3";
      };
    };

    ignores = [ ".DS_Store" ];

    includes =
      let
        credentialHelperConfig = pkgs.writeTextFile {
          name = "credential-helper-config";
          text = ''
            [credential "https://github.com"]
              helper =
              helper = !${pkgs.lib.getExe pkgs.gh} auth git-credential
            [credential "https://gist.github.com"]
              helper =
              helper = !${pkgs.lib.getExe pkgs.gh} auth git-credential;
          '';
        };
      in
      [ { path = credentialHelperConfig; } ];

    userName = "Christian Wesselhoeft";
    userEmail = "hi@xtian.us";
  };
}
