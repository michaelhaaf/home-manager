{ pkgs }:

with pkgs;
let shared-packages = import ./default.nix { inherit pkgs; }; in
shared-packages ++ [
  fswatch
  dockutil
]
