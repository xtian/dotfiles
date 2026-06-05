{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # https://github.com/NixOS/nixpkgs/pull/465669
      set -e DEVELOPER_DIR

      set fish_greeting
      fish_config prompt choose informative_vcs

      function _sync_pi_theme --on-event fish_prompt
        set -l appearance dark
        if defaults read -g AppleInterfaceStyle &>/dev/null
          set appearance dark
        else
          set appearance light
        end
        echo "{\"family\":\"gruvbox\",\"appearance\":\"$appearance\"}" > ~/.pi/agent/pi-theme.json 2>/dev/null
        functions -e _sync_pi_theme
      end
    '';
    functions = {
      fish_jj_prompt.body = ''
        if not command -sq jj
            return 1
        end

        jj log --ignore-working-copy --no-graph --color always -r @ -T '
            surround(
                " (",
                ")",
                separate(
                    " ",
                    bookmarks.join(", "),
                    change_id.shortest(),
                    if(conflict, label("conflict", "×")),
                    if(empty, label("empty", "∅")),
                    if(divergent, label("divergent", "D")),
                )
            )
        ' 2>/dev/null
        or return 1
      '';
    };
  };
}
