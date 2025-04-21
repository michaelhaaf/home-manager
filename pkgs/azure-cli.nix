# Need a pinned version of azure-cli in order to use the azure-iot extension.
# See: https://github.com/NixOS/nixpkgs/commit/ab15130c1a8a76cea8fd5bf8ee4728d209bedbb2
# And: https://github.com/NixOS/nixpkgs/issues/310525
# And: https://github.com/Azure/azure-iot-sdk-python/issues/1196
# Approach adapted from: https://stackoverflow.com/a/79021669
# Note: ended up using a python venv for azure-cli instead, but keeping this here as an example that "works"
{
  pkgs, ...
}: let
  pkgs_azurecli = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/21808d22b1cda1898b71cf1a1beb524a97add2c4.tar.gz";
        sha256 = "0v2z6jphhbk1ik7fqhlfnihcyff5np9wb3pv19j9qb9mpildx0cg";
    }) {
      inherit (pkgs) system;
    };
in {
  home.packages = with pkgs_azurecli; [
    (python312Packages.uamqp.overrideAttrs (old: {
      NIX_CFLAGS_COMPILE="-Wno-error=incompatible-pointer-types";
    }))
    (azure-cli.withExtensions [azure-cli-extensions.azure-iot])
  ];
}
