{
  pkgs,
  config,
  ...
}:
{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "overlay";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      control-center-width = 500;
      control-center-height = 600;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;

      control-center-exclusive-zone = true;
    };

    style = ''
      * {
        all: unset;
        font-size: ${toString config.stylix.fonts.sizes.applications}px;
        font-family: ${config.stylix.fonts.monospace.name};
        transition: 200ms;
      }

      .floating-notifications.background .notification-row .notification-background {
        box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.8), inset 0 0 0 1px #${config.lib.stylix.colors.base0D};
        border-radius: 12px;
        margin: 18px;
        background: #${config.lib.stylix.colors.base01};
        padding: 0;
      }

      .floating-notifications.background .notification-row .notification-background .notification {
        padding: 7px;
        border-radius: 12px;
      }

      .floating-notifications.background .notification-row .notification-background .notification.critical {
        box-shadow: inset 0 0 7px 0 #${config.lib.stylix.colors.base08};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content {
        margin: 7px;
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .summary {
        color: #${config.lib.stylix.colors.base05};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .time {
        color: #${config.lib.stylix.colors.base03};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .body {
        color: #${config.lib.stylix.colors.base04};
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * {
        min-height: 3.4em;
      }

      .floating-notifications.background .notification-row .notification-background .close-button {
        margin: 7px;
        padding: 2px;
        border-radius: 6px;
        color: #${config.lib.stylix.colors.base00};
        background-color: #${config.lib.stylix.colors.base08};
      }

      .floating-notifications.background .notification-row .notification-background .close-button:hover {
        background-color: #${config.lib.stylix.colors.base0E};
      }

      .floating-notifications.background .notification-row .notification-background .close-button:active {
        background-color: #${config.lib.stylix.colors.base0F};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-action {
        border-radius: 7px;
        color: #${config.lib.stylix.colors.base05};
        box-shadow: inset 0 0 0 1px #${config.lib.stylix.colors.base0D};
        background-color: #${config.lib.stylix.colors.base02};
        margin: 4px;
        padding: 8px;
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-action:hover {
        background-color: #${config.lib.stylix.colors.base03};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-action:active {
        background-color: #${config.lib.stylix.colors.base04};
      }

      .control-center {
        box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.8), inset 0 0 0 1px #${config.lib.stylix.colors.base0D};
        border-radius: 12px;
        background-color: #${config.lib.stylix.colors.base00};
        color: #${config.lib.stylix.colors.base05};
        padding: 14px;
      }

      .control-center .notification-row .notification-background {
        border-radius: 7px;
        box-shadow: inset 0 0 0 1px #${config.lib.stylix.colors.base0D};
        background: #${config.lib.stylix.colors.base01};
        margin: 4px 10px;
      }

      .control-center .notification-row .notification-background:hover {
        background-color: #${config.lib.stylix.colors.base02};
      }

      .control-center .notification-row .notification-background .notification {
        padding: 7px;
        border-radius: 7px;
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary {
        color: #${config.lib.stylix.colors.base05};
      }

      .control-center .notification-row .notification-background .notification .notification-content .time {
        color: #${config.lib.stylix.colors.base03};
      }

      .control-center .notification-row .notification-background .notification .notification-content .body {
        color: #${config.lib.stylix.colors.base04};
      }

      .control-center .notification-row .notification-background .notification .notification-action {
        border-radius: 7px;
        color: #${config.lib.stylix.colors.base05};
        box-shadow: inset 0 0 0 1px #${config.lib.stylix.colors.base0D};
        background-color: #${config.lib.stylix.colors.base02};
        margin: 4px;
        padding: 8px;
      }

      .control-center .notification-row .notification-background .notification .notification-action:hover {
        background-color: #${config.lib.stylix.colors.base03};
      }

      .control-center .notification-row .notification-background .notification .notification-action:active {
        background-color: #${config.lib.stylix.colors.base04};
      }

      .control-center .notification-row .notification-background .close-button {
        margin: 7px;
        padding: 2px;
        border-radius: 6px;
        color: #${config.lib.stylix.colors.base00};
        background-color: #${config.lib.stylix.colors.base08};
      }

      .control-center .notification-row .notification-background .close-button:hover {
        background-color: #${config.lib.stylix.colors.base0E};
      }

      .control-center .notification-row .notification-background .close-button:active {
        background-color: #${config.lib.stylix.colors.base0F};
      }

      .control-center .widget-title > label {
        color: #${config.lib.stylix.colors.base05};
        font-size: ${toString (config.stylix.fonts.sizes.applications + 4)}px;
      }

      .control-center .widget-title button {
        border-radius: 7px;
        color: #${config.lib.stylix.colors.base05};
        background-color: #${config.lib.stylix.colors.base02};
        box-shadow: inset 0 0 0 1px #${config.lib.stylix.colors.base0D};
        padding: 8px;
      }

      .control-center .widget-title button:hover {
        background-color: #${config.lib.stylix.colors.base03};
      }

      .control-center .widget-title button:active {
        background-color: #${config.lib.stylix.colors.base04};
      }

      .widget-dnd {
        margin-top: 5px;
        border-radius: 8px;
        font-size: ${toString (config.stylix.fonts.sizes.applications + 2)}px;
      }

      .widget-dnd > switch {
        font-size: initial;
        border-radius: 8px;
        background: #${config.lib.stylix.colors.base02};
        box-shadow: none;
      }

      .widget-dnd > switch:checked {
        background: #${config.lib.stylix.colors.base0B};
      }

      .widget-dnd > switch slider {
        background: #${config.lib.stylix.colors.base04};
        border-radius: 8px;
      }

      .image {
        padding-right: 0.5rem;
      }
    '';
  };
}
