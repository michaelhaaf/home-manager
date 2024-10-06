{ pkgs, ... }: {
  home.username = "michael"; 
  home.homeDirectory = "/home/michael"; 
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.sl
    pkgs.neovim
  ];
}
