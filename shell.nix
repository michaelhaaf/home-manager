{ config, pkgs, ...}:
{

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
        . ${pkgs.pass.extensions.pass-otp}/share/bash-completion/completions/pass-otp
      '';
      shellAliases = {
        ll="eza -l --icons=auto --group-directories-first";
        ls="eza";
        l1="eza -1";
        la="eza -a";
      };
    };

    fzf = {
      enable = true;
      fileWidgetOptions = [
        "--height 60%"
        "--border sharp"
        "--layout reverse"
        "--prompt '∷ '"
        "--preview 'bat -n --color=always {}'"
      ];
    };

    starship = {
      enable = true;
      enableTransience = true;
      enableZshIntegration = false;
    };

    atuin = {
      enable = true;
      enableZshIntegration = false;
      flags = [ "--disable-up-arrow" ];
    };

    zoxide = {
      enable = true;
      enableZshIntegration = false;
      options = [
        "--cmd"
        "c"
      ];
    };

    direnv = {
      enable = true;
      enableZshIntegration = false;
      nix-direnv.enable = true;
    };

    broot = {
      enable = true;
    };

    yazi = {
      enable = true;
    };

  };

}
