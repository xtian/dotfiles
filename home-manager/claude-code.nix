{ pkgs, ... }:
{
  programs.claude-code = {
    enable = true;

    package = pkgs.symlinkJoin {
      name = "claude-code-bun";
      paths = [ pkgs.claude-code-bun ];
      postBuild = "ln -s $out/bin/claude-bun $out/bin/claude";
    };

    mcpServers = {
      chrome-devtools = {
        command = "bunx";
        args = [
          "chrome-devtools-mcp@latest"
          "--channel=beta"
          "--autoConnect"
        ];
      };
    };

    settings = {
      autoUpdaterStatus = "disabled";

      hooks = {
        Stop = [
          {
            hooks = [
              {
                type = "command";
                command = "afplay /System/Library/Sounds/Submarine.aiff";
              }
            ];
          }
        ];
        Notification = [
          {
            matcher = "permission_prompt";
            hooks = [
              {
                type = "command";
                command = "afplay /System/Library/Sounds/Bottle.aiff";
              }
            ];
          }
        ];
      };

      permissions = {
        allow = [
          "Bash(bun tsc:*)"
          "Bash(gh api:*)"
          "Bash(gh issue list:*)"
          "Bash(gh issue view:*)"
          "Bash(gh pr list:*)"
          "Bash(gh pr view:*)"
          "Bash(gh repo view:*)"
          "Bash(jj diff:*)"
          "Bash(jj log:*)"
          "Bash(jj op log:*)"
          "Bash(jj show:*)"
          "Bash(jj status:*)"
          "Bash(mix compile:*)"
          "Bash(mix credo:*)"
          "Bash(mix deps.get:*)"
          "Bash(mix format:*)"
          "Bash(mix hex.info:*)"
          "Bash(mix test:*)"
          "Bash(mix usage_rules:*)"
          "Bash(nix build *)"
          "Bash(nix derivation *)"
          "Bash(nix eval *)"
          "Bash(nix flake *)"
          "Bash(nix fmt)"
          "Bash(nix path-info *)"
          "Bash(nix search *)"
          "Bash(nix show-derivation *)"
          "Bash(nix-store *)"
          "Bash(npm view:*)"
          "Read(//nix/store/**)"
          "WebFetch(domain:api.github.com)"
          "WebFetch(domain:gist.github.com)"
          "WebFetch(domain:github.com)"
          "WebFetch(domain:hex.pm)"
          "WebFetch(domain:hexdocs.pm)"
          "WebFetch(domain:npmjs.com)"
          "WebFetch(domain:raw.githubusercontent.com)"
          "WebFetch(domain:svelte.dev)"
          "WebSearch"
          "mcp__chrome-devtools__*"
        ];
      };
    };
  };
}
