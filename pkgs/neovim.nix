{
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraLuaPackages = ps: [ps.magick];
    plugins = [
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
        bash
        css
        html
        lua
        javascript
        latex
        markdown
        nix
        rust
        typescript
        vim
      ]))
    ];
  };
}
