{ config, pkgs, lib, ... }:

with lib;
let
  build-dependent-pkgs = with pkgs; [
    acl
    attr
    bzip2
    curl
    dbus
    fontconfig
    freetype
    gcc
    glib
    glibc
    libcxx
    libglvnd
    libsodium
    libssh
    libx11
    libxcb-cursor
    libxkbcommon
    libxml2
    openssl
    stdenv.cc.cc
    stdenv.cc.cc.lib
    systemd
    util-linux
    wayland
    xz
    zlib
    zstd
  ];

  neovim-build-deps = pkgs.buildEnv {
    name = "neovim-build-deps";
    paths = build-dependent-pkgs;
    extraOutputsToInstall = [ "dev" ];
    pathsToLink = [ "/lib" "/include" ];
    ignoreCollisions = true;
  };

  buildEnv = [
    "CPATH=\${CPATH:+\${CPATH}:}${neovim-build-deps}/include"
    "CPLUS_INCLUDE_PATH=\${CPLUS_INCLUDE_PATH:+\${CPLUS_INCLUDE_PATH}:}:${neovim-build-deps}/include/c++/v1"
    "LD_LIBRARY_PATH=\${LD_LIBRARY_PATH:+\${LD_LIBRARY_PATH}:}${neovim-build-deps}/lib"
    "LIBRARY_PATH=\${LIBRARY_PATH:+\${LIBRARY_PATH}:}${neovim-build-deps}/lib"
    "NIX_LD_LIBRARY_PATH=\${NIX_LD_LIBRARY_PATH:+\${NIX_LD_LIBRARY_PATH}:}${neovim-build-deps}/lib"
    "PKG_CONFIG_PATH=\${PKG_CONFIG_PATH:+\${PKG_CONFIG_PATH}:}${neovim-build-deps}/include/pkgconfig"
  ];

in {
  home.packages = with pkgs; [ ripgrep ];

  programs.neovim = {
    autowrapRuntimeDeps = true;
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    extraLuaPackages = ls: with ls; [ luarocks ];
    extraPackages = with pkgs; [
      doq
      tree-sitter
      sqlite
      cargo
      clang
      cmake
      gcc
      gnumake
      go
      ninja
      pkg-config
      statix
      yarn
    ];
    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      # (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
      #   bash
      #   css
      #   html
      #   lua
      #   javascript
      #   latex
      #   markdown
      #   nix
      #   python
      #   rust
      #   typescript
      #   vim
      # ]))
    ];
    extraWrapperArgs = [
      "--suffix"
      "CPATH"
      ":"
      "${neovim-build-deps}/include"
      "--suffix"
      "CPLUS_INCLUDE_PATH"
      ":"
      "${neovim-build-deps}/include/c++/v1"
      "--suffix"
      "LD_LIBRARY_PATH"
      ":"
      "${neovim-build-deps}/lib"
      "--suffix"
      "LIBRARY_PATH"
      ":"
      "${neovim-build-deps}/lib"
      "--suffix"
      "PKG_CONFIG_PATH"
      ":"
      "${neovim-build-deps}/include/pkgconfig"
      "--suffix"
      "NIX_LD_LIBRARY_PATH"
      ":"
      "${neovim-build-deps}/lib"
    ];
  };
}
