{ codex, system, ... }:
{
  programs.codex = {
    enable = true;

    package = codex.packages.${system}.default;

    # settings = {
    #   approval_policy = "on-request";
    #   approvals_reviewer = "auto_review";
    #   check_for_update_on_startup = false;

    #   hooks = {
    #     PermissionRequest = [
    #       {
    #         hooks = [
    #           {
    #             type = "command";
    #             command = "/usr/bin/afplay /System/Library/Sounds/Bottle.aiff";
    #           }
    #         ];
    #       }
    #     ];
    #     Stop = [
    #       {
    #         hooks = [
    #           {
    #             type = "command";
    #             command = "/usr/bin/afplay /System/Library/Sounds/Submarine.aiff";
    #           }
    #         ];
    #       }
    #     ];
    #   };

    #   mcp_servers.chrome-devtools = {
    #     args = [
    #       "chrome-devtools-mcp@latest"
    #       "--channel=beta"
    #       "--autoConnect"
    #     ];
    #     command = "bunx";
    #   };

    #   projects."/Users/xtian/Projects/wg-core".trust_level = "trusted";

    #   sandbox_mode = "workspace-write";
    #   tui.alternate_screen = "always";
    #   web_search = "live";
    # };
  };
}
