{ pkgs, ... }: {
  home.username = "michael"; 
  home.homeDirectory = "/home/michael"; 
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.sl
    pkgs.cava

    pkgs.stow
    pkgs.gnumake

    pkgs.neovim

    pkgs.gcc
    pkgs.zig
    pkgs.go

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

    pkgs.nodejs
    pkgs.gjs
    pkgs.bun
    pkgs.typescript
    pkgs.eslint

    pkgs.jq
  ];
}
