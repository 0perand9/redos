{
  pkgs,
  config,
  ...
}:
{
  services.swaync = {
    enable = true;
    style = ''
      * {
        font-family: ${config.stylix.fonts.monospace.name};
        font-size: ${toString config.stylix.fonts.sizes.applications}px;
      }

      .notification {
        background: #${config.lib.stylix.colors.base01};
        color: #${config.lib.stylix.colors.base05};
        border: 2px solid #${config.lib.stylix.colors.base0D};
        border-radius: 8px;
      }

      .notification-content {
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
      }

      .control-center {
        background: #${config.lib.stylix.colors.base00};
        border: 2px solid #${config.lib.stylix.colors.base0D};
      }

      .notification-row {
        background: #${config.lib.stylix.colors.base01};
      }

      .notification-row:hover {
        background: #${config.lib.stylix.colors.base02};
      }

      button {
        background: #${config.lib.stylix.colors.base0D};
        color: #${config.lib.stylix.colors.base00};
        border-radius: 4px;
      }

      button:hover {
        background: #${config.lib.stylix.colors.base0E};
      }
    '';
  };
}
