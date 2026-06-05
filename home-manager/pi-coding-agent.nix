_:
let
  settings = {
    defaultProvider = "zai";
    defaultModel = "glm-5.2";

    enabledModels = [
      "glm-*"
    ];

    packages = [
      "npm:@narumitw/pi-plan-mode"
      "npm:@smoose/pi-themes"
      "npm:pi-auto-mode"
      "npm:pi-elixir"
      "npm:pi-hermes-memory"
      "npm:pi-lean-ctx"
      "npm:pi-lens"
      "npm:pi-mcp-adapter"
      "npm:pi-simplify"
      "npm:pi-subagents"
    ];

    compaction = {
      enabled = true;
      reserveTokens = 16384;
      keepRecentTokens = 20000;
    };

    retry = {
      enabled = true;
      maxRetries = 3;
    };
  };
in
{
  home.file = {
    ".pi/agent/settings.json" = {
      force = true;
      text = builtins.toJSON settings;
    };
  };
}
