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

    extraLuaConfig = ''
      vim.opt.shortmess:append("I")

      vim.opt.background = "light"
      vim.cmd("colorscheme gruvbox")

      vim.opt.laststatus = 2

      vim.g.airline_theme = "base16_gruvbox_light_medium"

      vim.g.airline_left_sep = ""
      vim.g.airline_right_sep = ""

      vim.g["airline#extensions#tabline#left_sep"] = ""
      vim.g["airline#extensions#tabline#left_alt_sep"] = ""

      vim.g["airline#extensions#tabline#enabled"] = 1
    '';
  };
}
