# Adapted from https://github.com/Misterio77/nix-starter-configs/

{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    ./neovim.nix
    ./chezmoi.nix
  ];

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      # outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages
      # You can also add overlays exported from other flakes:
      neovim-nightly-overlay.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "michael";
    homeDirectory = "/home/michael";
  };
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
  home.packages = pkgs.callPackage ../pkgs/linux.nix {};
}


