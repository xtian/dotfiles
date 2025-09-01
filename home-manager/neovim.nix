{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      vim-airline
      vim-airline-themes
    ];

    extraConfig = ''
      set background=light
      colorscheme gruvbox

      set laststatus=2

      let g:airline_theme="base16_gruvbox_light_medium"

      let g:airline_left_sep=""
      let g:airline_right_sep=""

      let g:airline#extensions#tabline#left_sep=""
      let g:airline#extensions#tabline#left_alt_sep=""

      let g:airline#extensions#tabline#enabled=1
    '';
  };
}
