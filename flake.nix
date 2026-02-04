{
  description = "xtian system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ragenix.url = "github:yaxitech/ragenix";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ ragenix, self, ... }:
    let
      hostName = "xtian-mbp";
      primaryUser = "xtian";
      system = "aarch64-darwin";

      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix;

      specialArgs = inputs // {
        inherit
          hostName
          primaryUser
          ragenix
          self
          system
          ;
      };

      baseConfiguration = {
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
      };
    in
    {
      darwinConfigurations.${hostName} = inputs.nix-darwin.lib.darwinSystem {
        inherit system specialArgs;

        modules = [
          baseConfiguration
          inputs.determinate.darwinModules.default
          inputs.home-manager.darwinModules.home-manager
          inputs.ragenix.darwinModules.default
          ./darwin-system.nix
          ./homebrew.nix
          ./shell.nix
          (
            { config, ... }:
            {
              age.secrets.git-user-config = {
                file = ./secrets/git-user-config.age;
                owner = primaryUser;
              };

              home-manager = {
                extraSpecialArgs = specialArgs // {
                  gitUserConfigPath = config.age.secrets.git-user-config.path;
                };
                useGlobalPkgs = true;
                useUserPackages = true;
                verbose = true;
                users.${primaryUser} = import ./home-manager;
              };
            }
          )
        ];
      };

      formatter.${system} = treefmtEval.config.build.wrapper;
      checks.${system}.formatting = treefmtEval.config.build.check self;
    };
}
