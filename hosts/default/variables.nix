{
  gitUsername = "0perand9";
  gitEmail = "0perand9@gmail.com";

  hostname = "nixos-desktop";

  extraMonitorSettings = ''
    # Samsung 4K monitor
    monitor=DP-5,3840x2160@60,0x0,1

    # Asus 1080p monitor
    monitor=DP-4,1920x1080@60,3840x0,1
  '';

  mainMonitor = "DP-5"; # tells hyprlock to just have the input on this monitor
  waybarMonitors = [ "DP-5" ]; # waybar only ouputs on these monitors

  timeZone = "America/Chicago";
  keyboardLayout = "us";
  consoleKeyMap = "us";
  terminal = "kitty";

  browser = "firefox";

  wallpaper = "gargantua.jpg";

  services = [
    {
      name = "ollama";
      port = 8080;
      host = "127.0.0.1";
    }
    {
      name = "emby";
      port = 8096;
      host = "192.168.1.99";
    }
    {
      name = "jellyseerr";
      port = 5055;
      host = "192.168.1.99";
    }
    {
      name = "nzb";
      port = 6789;
      host = "192.168.1.99";
    }
    {
      name = "torrents";
      port = 9091;
      host = "192.168.1.99";
    }
    {
      name = "prowlarr";
      port = 9696;
      host = "192.168.1.99";
    }
    {
      name = "sonarr";
      port = 8989;
      host = "192.168.1.99";
    }
    {
      name = "radarr";
      port = 7878;
      host = "192.168.1.99";
    }
    {
      name = "jellyfin";
      port = 8099;
      host = "192.168.1.99";
    }
    {
      name = "botbuddy";
      port = 8881;
    }
  ];

  gpu-bypass = {
    enable = true;
    # RTX 3070 Ti
    gpuIds = [
      "10de:1c03" # Graphics
      "10de:10f1" # Audio
    ];
  };
}
