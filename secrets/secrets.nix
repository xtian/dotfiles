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
}
