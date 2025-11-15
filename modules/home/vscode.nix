{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    userSettings = {
      "workbench.colorTheme" = "Default Dark+"; # or any base theme
      "workbench.colorCustomizations" = {
        # Editor colors
        "editor.background" = "#${config.lib.stylix.colors.base00}";
        "editor.foreground" = "#${config.lib.stylix.colors.base05}";
        "editorLineNumber.foreground" = "#${config.lib.stylix.colors.base03}";
        "editorCursor.foreground" = "#${config.lib.stylix.colors.base0D}";
        "editor.selectionBackground" = "#${config.lib.stylix.colors.base02}";

        # Sidebar
        "sideBar.background" = "#${config.lib.stylix.colors.base01}";
        "sideBar.foreground" = "#${config.lib.stylix.colors.base05}";

        # Activity bar
        "activityBar.background" = "#${config.lib.stylix.colors.base01}";
        "activityBar.foreground" = "#${config.lib.stylix.colors.base0D}";

        # Status bar
        "statusBar.background" = "#${config.lib.stylix.colors.base02}";
        "statusBar.foreground" = "#${config.lib.stylix.colors.base05}";

        # Terminal
        "terminal.background" = "#${config.lib.stylix.colors.base00}";
        "terminal.foreground" = "#${config.lib.stylix.colors.base05}";
      };

      "editor.tokenColorCustomizations" = {
        "textMateRules" = [
          {
            scope = "comment";
            settings.foreground = "#${config.lib.stylix.colors.base03}";
          }
          {
            scope = "string";
            settings.foreground = "#${config.lib.stylix.colors.base0B}";
          }
          {
            scope = "keyword";
            settings.foreground = "#${config.lib.stylix.colors.base0E}";
          }
          {
            scope = "variable";
            settings.foreground = "#${config.lib.stylix.colors.base08}";
          }
          {
            scope = "function";
            settings.foreground = "#${config.lib.stylix.colors.base0D}";
          }
        ];
      };
    };
  };
}
