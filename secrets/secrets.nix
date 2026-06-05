let
  keys = import ../keys.nix;
in
{
  "./git-forgejo-credential.age" = {
    publicKeys = [
      keys.system
      keys.user
    ];
  };
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
