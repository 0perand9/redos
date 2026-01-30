{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.vscode = {
    enable = true;
    # profiles.default.userSettings = {
    #   "workbench.colorCustomizations" = lib.mkForce {
    #     # Editor - darkest
    #     "editor.background" = "#${config.lib.stylix.colors.base00}";
    #     "editor.foreground" = "#${config.lib.stylix.colors.base05}";
    #     "editorLineNumber.foreground" = "#${config.lib.stylix.colors.base03}";
    #     "editorLineNumber.activeForeground" = "#${config.lib.stylix.colors.base0D}";
    #     "editorCursor.foreground" = "#${config.lib.stylix.colors.base0D}";
    #     "editor.selectionBackground" = "#${config.lib.stylix.colors.base02}";

    #     # Everything else dark too
    #     "sideBar.background" = "#${config.lib.stylix.colors.base00}";
    #     "sideBar.foreground" = "#${config.lib.stylix.colors.base04}";
    #     "sideBar.border" = "#${config.lib.stylix.colors.base01}";

    #     "activityBar.background" = "#${config.lib.stylix.colors.base00}";
    #     "activityBar.foreground" = "#${config.lib.stylix.colors.base0D}";
    #     "activityBar.inactiveForeground" = "#${config.lib.stylix.colors.base03}";

    #     "statusBar.background" = "#${config.lib.stylix.colors.base00}";
    #     "statusBar.foreground" = "#${config.lib.stylix.colors.base04}";

    #     "panel.background" = "#${config.lib.stylix.colors.base00}";
    #     "panel.border" = "#${config.lib.stylix.colors.base01}";

    #     "terminal.background" = "#${config.lib.stylix.colors.base00}";
    #     "terminal.foreground" = "#${config.lib.stylix.colors.base05}";

    #     # Tabs - minimal contrast
    #     "editorGroupHeader.tabsBackground" = "#${config.lib.stylix.colors.base00}";
    #     "tab.activeBackground" = "#${config.lib.stylix.colors.base00}";
    #     "tab.activeForeground" = "#${config.lib.stylix.colors.base05}";
    #     "tab.activeBorderTop" = "#${config.lib.stylix.colors.base0D}";
    #     "tab.inactiveBackground" = "#${config.lib.stylix.colors.base00}";
    #     "tab.inactiveForeground" = "#${config.lib.stylix.colors.base03}";
    #     "tab.border" = "#${config.lib.stylix.colors.base00}";

    #     # Breadcrumb
    #     "breadcrumb.background" = "#${config.lib.stylix.colors.base00}";
    #     "breadcrumb.foreground" = "#${config.lib.stylix.colors.base03}";
    #     "breadcrumb.activeSelectionForeground" = "#${config.lib.stylix.colors.base0D}";

    #     "titleBar.activeBackground" = "#${config.lib.stylix.colors.base00}";
    #     "titleBar.activeForeground" = "#${config.lib.stylix.colors.base05}";

    #     "menu.background" = "#${config.lib.stylix.colors.base00}";
    #     "menu.foreground" = "#${config.lib.stylix.colors.base05}";

    #     # Lists - only slight highlights
    #     "list.activeSelectionBackground" = "#${config.lib.stylix.colors.base00}";
    #     # "list.activeSelectionForeground" = "#${config.lib.stylix.colors.base02}"; # Dark text on light selection
    #     "list.inactiveSelectionBackground" = "#${config.lib.stylix.colors.base03}";
    #     # "list.inactiveSelectionForeground" = "#${config.lib.stylix.colors.base05}";
    #     "list.hoverBackground" = "#${config.lib.stylix.colors.base03}";
    #     "list.hoverForeground" = "#${config.lib.stylix.colors.base04}";
    #   };

    #   "[nix]" = {
    #     "editor.defaultFormatter" = "brettm12345.nixfmt-vscode";
    #   };

    #   "editor.tokenColorCustomizations" = {
    #     "textMateRules" = [
    #       {
    #         scope = "comment";
    #         settings.foreground = "#${config.lib.stylix.colors.base03}";
    #       }
    #       {
    #         scope = [
    #           "string"
    #           "string.quoted"
    #         ];
    #         settings.foreground = "#${config.lib.stylix.colors.base0B}";
    #       }
    #       {
    #         scope = [
    #           "keyword"
    #           "storage.type"
    #           "storage.modifier"
    #         ];
    #         settings.foreground = "#${config.lib.stylix.colors.base0E}";
    #       }
    #       {
    #         scope = [
    #           "variable"
    #           "variable.other"
    #         ];
    #         settings.foreground = "#${config.lib.stylix.colors.base08}";
    #       }
    #       {
    #         scope = [
    #           "entity.name.function"
    #           "support.function"
    #         ];
    #         settings.foreground = "#${config.lib.stylix.colors.base0D}";
    #       }
    #       {
    #         scope = [
    #           "entity.name.type"
    #           "entity.name.class"
    #           "support.class"
    #         ];
    #         settings.foreground = "#${config.lib.stylix.colors.base0A}";
    #       }
    #       {
    #         scope = "constant.numeric";
    #         settings.foreground = "#${config.lib.stylix.colors.base09}";
    #       }
    #     ];
    #   };
    # };
  };
}
