{ pkgs, config, ... }:
{
  programs.vscode = {
    enable = true;
    userSettings = {
      programs.vscode = {
        profiles.default.userSettings = {
          "workbench.colorCustomizations" = {
            # Use darker, more muted versions
            "editor.background" = "#${config.lib.stylix.colors.base00}";
            "sideBar.background" = "#${config.lib.stylix.colors.base00}"; # Same as editor
            "activityBar.background" = "#${config.lib.stylix.colors.base00}";
            "statusBar.background" = "#${config.lib.stylix.colors.base00}";

            # Only accent the active elements
            "activityBar.activeBorder" = "#${config.lib.stylix.colors.base0D}";
            "editorLineNumber.activeForeground" = "#${config.lib.stylix.colors.base0D}";
          };
        };
      };
      #   "workbench.colorTheme" = "Default Dark+"; # or any base theme
      #   "workbench.colorCustomizations" = {
      #     # Editor colors
      #     "editor.background" = "#${config.lib.stylix.colors.base00}";
      #     "editor.foreground" = "#${config.lib.stylix.colors.base05}";
      #     "editorLineNumber.foreground" = "#${config.lib.stylix.colors.base03}";
      #     "editorCursor.foreground" = "#${config.lib.stylix.colors.base0D}";
      #     "editor.selectionBackground" = "#${config.lib.stylix.colors.base02}";

      #     # Sidebar
      #     "side`Bar.background" = "#${config.lib.stylix.colors.base01}";
      #     "sideBar.foreground" = "#${config.lib.stylix.colors.base05}";

      #     # Activity bar
      #     "activityBar.background" = "#${config.lib.stylix.colors.base01}";
      #     "activityBar.foreground" = "#${config.lib.stylix.colors.base0D}";

      #     # Status bar
      #     "statusBar.background" = "#${config.lib.stylix.colors.base02}";
      #     "statusBar.foreground" = "#${config.lib.stylix.colors.base05}";

      #     # Terminal
      #     "terminal.background" = "#${config.lib.stylix.colors.base00}";
      #     "terminal.foreground" = "#${config.lib.stylix.colors.base05}";
      #   };

      #   "editor.tokenColorCustomizations" = {
      #     "textMateRules" = [
      #       {
      #         scope = "comment";
      #         settings.foreground = "#${config.lib.stylix.colors.base03}";
      #       }
      #       {
      #         scope = "string";
      #         settings.foreground = "#${config.lib.stylix.colors.base0B}";
      #       }
      #       {
      #         scope = "keyword";
      #         settings.foreground = "#${config.lib.stylix.colors.base0E}";
      #       }
      #       {
      #         scope = "variable";
      #         settings.foreground = "#${config.lib.stylix.colors.base08}";
      #       }
      #       {
      #         scope = "function";
      #         settings.foreground = "#${config.lib.stylix.colors.base0D}";
      #       }
      #     ];
      #   };
    };
  };
}
