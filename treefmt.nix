_: {
  projectRootFile = "flake.nix";

  programs = {
    actionlint.enable = true;
    deadnix.enable = true;
    fish_indent.enable = true;
    flake-edit.enable = true;
    nixf-diagnose.enable = true;
    nixfmt.enable = true;
    oxfmt.enable = true;
    statix.enable = true;
  };
}
