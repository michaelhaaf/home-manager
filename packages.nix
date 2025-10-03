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
    atuin
    bat
    bc
    btop
    chafa
    coreutils
    curl
    delta
    difftastic
    direnv
    du-dust
    dwt1-shell-color-scripts
    eza
    fd
    gawk
    gettext
    gitFull
    gnumake
    gnused
    gzip
    htop
    iftop
    inotify-tools
    jq
    lazygit
    mpv
    neofetch
    nmap
    openssh
    parallel
    rclone
    ripgrep
    rsync
    sops
    sqlite
    starship
    tree
    unzip
    watch
    wev
    wget
    yq
    zellij
    zip
    zoxide

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

    # Dotfile management
    stow
    chezmoi

    # Media management
    imagemagick
    ffmpeg

    # PDF
    pandoc
    zathura
    pdftk
    ghostscript
    libreoffice-fresh
    ocrmypdf
  ];
}
