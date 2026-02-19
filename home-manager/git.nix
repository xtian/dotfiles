{ pkgs, ... }:
let
  keys = import ../keys.nix;
in
{
  programs.git = {
    enable = true;
    maintenance.enable = true;

    settings = {
      advice = {
        defaultBranchName = false;
      };
      alias = {
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
      rebase = {
        updateRefs = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      user = {
        name = "Christian Wesselhoeft";
        email = "hi@xtian.us";
        signingkey = keys.user;
      };
    };

    ignores = [ ".DS_Store" ];

    includes =
      let
        credentialHelperConfig = pkgs.writeText "credential-helper-config" ''
          [credential "https://github.com"]
            helper =
            helper = !${pkgs.lib.getExe pkgs.gh} auth git-credential
          [credential "https://gist.github.com"]
            helper =
            helper = !${pkgs.lib.getExe pkgs.gh} auth git-credential;
        '';
      in
      [
        { path = credentialHelperConfig; }
      ];
  };
}
