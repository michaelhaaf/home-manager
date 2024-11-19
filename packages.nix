{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # General
    aspell
    aspellDicts.en
    bash-completion
    bat
    btop
    coreutils
    difftastic
    du-dust
    fzf
    neofetch
    openssh
    pandoc
    sqlite
    wget
    zellij
    zip
    ripgrep
    htop
    jq
    yq
    nix-bash-completions
    tree
    watch
    wget
    curl
    fd
    iftop
    unzip
    gnumake
    parallel
    chafa
    bc
    direnv

    # SDKs
    gcc
    zig
    go
    cargo
    rustc
    swi-prolog
    ghc
    cabal-install
    perl
    ruby
    python3
    R

    # Web dev tools
    quarto
    nodejs
    gjs
    bun
    typescript

    # Encryption and security tools
    age
    age-plugin-yubikey
    gnupg
    pass
    fuzzel
    tessen

    # Repository management
    hub
    gh
    act
    codeberg-cli
    
    # Dotfile management
    stow
    chezmoi

    # Media management
    imagemagick
    ffmpeg

    # PDF
    zathura
    pdftk
    ghostscript
  ];
}
