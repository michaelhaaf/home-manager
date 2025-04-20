# Adapted from https://github.com/Misterio77/nix-starter-configs/
# and https://github.com/Arkham/dotfiles.nix/blob/main/home.nix

{
  pkgs,
  ...
}: {
  home = {
    username = "michael";
    homeDirectory = "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/michael";
  };
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  imports = [
    ./packages.nix
    ./pkgs/neovim.nix
    ./shell/bash.nix
    ./pkgs/azure-cli.nix
  ];

}
