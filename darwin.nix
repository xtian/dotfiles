{
  primaryUser,
  self,
  system,
  ...
}:
{
  # Use Determinate Nix
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  system.primaryUser = primaryUser;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
