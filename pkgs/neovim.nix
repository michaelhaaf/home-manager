{
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
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
        python
        rust
        typescript
        vim
      ]))
    ];
  };
}
