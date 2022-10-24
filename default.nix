
pkgs: 

{
    enable = true;
    extraConfig = ''
      luafile ~/.config/nvim/setting.lua
      luafile ~/.config/nvim/mapping.lua
      luafile ~/.config/nvim/modules/telescope.lua
    '';
    
    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      popup-nvim
      vim-nix
      catppuccin-nvim
      indentLine
      nvim-web-devicons
      telescope-nvim
      {
        plugin = nvim-treesitter;
        config = ''
          lua << EOF
           require('nvim-treesitter.configs').setup {
            highlight = {
              enable = true,
              additional_vim_regex_highlighting = true,
            },
          }
          EOF
        '';
      } 
    ];

}


