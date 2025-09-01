{
  programs.readline = {
    enable = true;

    bindings = {
      "\\C-a" = "beginning-of-line";
      "\\C-l" = "clear-screen";
      "\\e[3;3~" = "kill-word";
      "\\e[A" = "history-search-backward";
      "\\e[B" = "history-search-forward";
    };

    variables = {
      colored-stats = "on";
      completion-ignore-case = "on";
      completion-query-items = "200";
      convert-meta = "on";
      input-meta = "on";
      mark-symlinked-directories = "on";
      output-meta = "on";
      page-completions = "off";
      show-all-if-ambiguous = "on";
      skip-completed-text = "on";
      visible-stats = "on";
    };
  };
}
