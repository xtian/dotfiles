let
  keys = import ../keys.nix;
in
{
  "./git-user-config.age" = {
    publicKeys = [
      keys.system
      keys.user
    ];
  };
  "./rbw-config.age" = {
    publicKeys = [
      keys.system
      keys.user
    ];
  };
}
