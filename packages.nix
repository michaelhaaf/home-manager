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
    dust
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
    mermaid-cli
    mpv
    neofetch
    nmap
    openssh
    parallel
    rclone
    rename
    ripgrep
    rsync
    sops
    sqlite
    starship
    strace
    tree
    unzip
    watch
    wev
    wget
    wordnet
    yq
    zellij
    zip
    zoxide

    # nix utilites
    nh
    nix-output-monitor

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
    ocrmypdf
  ];
}
