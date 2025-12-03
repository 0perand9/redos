{
  pkgs,
  username,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = username;
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland"; # start Hyprland with a TUI login manager
        # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd 'startplasma-x11'";
      };
    };
  };
}
