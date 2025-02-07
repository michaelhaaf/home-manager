{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Fix locales
    glibcLocales

    # terminal recording
    asciinema
    asciinema-agg

    # General
    aspell
    aspellDicts.en
    bat
    btop
    coreutils
    difftastic
    du-dust
    neofetch
    openssh
    pandoc
    sqlite
    wget
    zellij
    zip
    ripgrep
    btop
    htop
    jq
    yq
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
    eza
    rsync
    rclone
    gnused
    zoxide
    gzip
    git
    lazygit
    gettext
    gawk
    atuin
    nmap
    wev
    starship
    dwt1-shell-color-scripts
    delta
    wkhtmltopdf
    sops

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
    R
    tree-sitter

    # Web dev tools
    quarto
    nodejs
    gjs
    bun
    typescript

    # Encryption and security tools
    age
    gnupg
    (pass.withExtensions (ext: [ ext.pass-otp ]))
    fuzzel
    tessen

    # Repository management
    hub
    gh
    act
    codeberg-cli
    azure-cli
    
    # Dotfile management
    stow
    chezmoi

    # Media management
    imagemagick
    ffmpeg
    luajit
    prettierd

    # PDF
    pandoc
    zathura
    pdftk
    ghostscript
    libreoffice-fresh
  ];
}
