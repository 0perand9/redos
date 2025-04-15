{
  pkgs,
  username,
  ...
}: {
  services.greetd = {
    enable = true;
    vt = 7;
    settings = {
      default_session = {
        user = username;
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland"; # start Hyprland with a TUI login manager
        # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd 'startplasma-x11'";
      };
    };
  };
}
