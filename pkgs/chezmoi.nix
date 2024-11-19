{
    pkgs,
    lib,
    ...
}: let
  chezrepo = "https://github.com/michaelhaaf/chezfiles.git";
in {
    home.packages = with pkgs; [ chezmoi pass ];

    home.activation.chezmoi = lib.hm.dag.entryAfter ["writeBoundary"] ''
      ${pkgs.chezmoi}/bin/chezmoi init --apply --verbose ${chezrepo}
    '';
}
