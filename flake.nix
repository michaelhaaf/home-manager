{
  description = "michael's nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay/master";
      # no input overrides to use binary cache
    };

  };

 outputs = { nixpkgs, home-manager, nix-index-database, ... }:
    let
      withArch = arch:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${arch};
          modules = [ ./home.nix nix-index-database.hmModules.nix-index ];
        };
    in {
      defaultPackage = {
        x86_64-linux = home-manager.defaultPackage.x86_64-linux;
        x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
        aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
        aarch64-linux = home-manager.defaultPackage.aarch64-linux;
      };

      homeConfigurations = {
        "michael@home" = withArch "x86_64-linux";
        "michael@laptop" = withArch "x86_64-linux";
        "michael@wsl" = withArch "x86_64-linux";
        "michael@osx" = withArch "aarch64-darwin";
      };
    };
}
