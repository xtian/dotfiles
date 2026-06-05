{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    barlow
    comfortaa
    dm-sans
    inter
    jost
    league-spartan
    libre-franklin
    lora
    merriweather
    nerd-fonts.symbols-only
    nunito
    nunito-sans
    open-sans
    poppins
    quicksand
    rubik
    source-serif
    vollkorn
    work-sans
  ];
}
