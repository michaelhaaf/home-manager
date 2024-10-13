{ pkgs, ... }: {
  home.username = "michael"; 
  home.homeDirectory = "/home/michael"; 
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.sl
    pkgs.stow

    pkgs.neovim

    pkgs.gcc
    pkgs.zig

    pkgs.pandoc
    pkgs.R
    pkgs.quarto
    pkgs.perl

    pkgs.ruby

    pkgs.cargo
    pkgs.rustc

    pkgs.swi-prolog
    pkgs.gprolog
    pkgs.ciao

    pkgs.ghc
    pkgs.cabal-install
  ];
}
