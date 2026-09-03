{
  description = "xtian system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    claude-code = {
      url = "github:sadjow/claude-code-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix.inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kimi-cli = {
      url = "github:MoonshotAI/kimi-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ragenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.agenix.inputs.home-manager.follows = "home-manager";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      claude-code,
      ragenix,
      self,
      ...
    }:
    let
      hostName = "xtian-mbp";
      primaryUser = "xtian";
      primaryUserEmail = "hi@xtian.us";
      primaryUserName = "Christian Wesselhoeft";
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
          primaryUserEmail
          primaryUserName
          ragenix
          self
          system
          ;
      };

      baseConfiguration = {
        # Use Determinate Nix
        nix.enable = false;

        determinateNix.determinateNixd = {
          builder.cpuCount = 4;
          builder.memoryBytes = 16 * 1024 * 1024 * 1024;
          garbageCollector.strategy = "automatic";
        };

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
          ./fonts.nix
          ./homebrew.nix
          ./shell.nix
          ({ config, ... }: {
            age.secrets.rbw-config = {
              file = ./secrets/rbw-config.age;
              owner = primaryUser;
            };

            home-manager = {
              extraSpecialArgs = specialArgs // {
                rbwConfigPath = config.age.secrets.rbw-config.path;
              };

              backupFileExtension = "backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${primaryUser} = import ./home-manager;
              verbose = true;
            };

            nixpkgs.overlays = [
              claude-code.overlays.default

              # https://github.com/NixOS/nixpkgs/pull/552262
              (final: _prev: {
                oh-my-pi = final.callPackage (final.fetchurl {
                  url = "https://raw.githubusercontent.com/NixOS/nixpkgs/401b4d033ec641009f0deda5a200713b333715aa/pkgs/by-name/oh/oh-my-pi/package.nix";
                  hash = "sha256-Puo39uO9k9knfdCjsHQbQPgzeWsyzwLK349W5qh9TgI=";
                }) { };
              })
            ];
          })
        ];
      };

      formatter.${system} = treefmtEval.config.build.wrapper;
    };
}
