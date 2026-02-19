let
  keys = import ../keys.nix;
in
{
  programs.jujutsu = {
    enable = true;
    settings = {
      aliases = {
        d = [ "desc" ];
        f = [
          "git"
          "fetch"
        ];
        n = [ "new" ];
        p = [
          "git"
          "push"
        ];
        s = [ "st" ];
      };

      user = {
        name = "Christian Wesselhoeft";
        email = "hi@xtian.us";
      };

      ui.diff-formatter = [ "difft" "--color=always" "$left" "$right" ];

      signing = {
        sign-all = true;
        backend = "ssh";
        key = keys.user;
        backends.ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
    };
  };
}
