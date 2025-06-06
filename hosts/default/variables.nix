{
  gitUsername = "0perand9";
  gitEmail = "0perand9@gmail.com";

  hostname = "nixos-desktop";

  extraMonitorSettings = ''
    # Samsung 4K monitor (DP-2)
    monitor=DP-2,3840x2160@60,0x0,1

    # Asus 1080p monitor (DP-1)
    monitor=DP-1,1920x1080@60,3840x0,1
  '';

  mainMonitor = "DP-2";        # tells hyprlock to just have the input on this monitor
  waybarMonitors = [ "DP-2" ]; # waybar only ouputs on these monitors

  timeZone = "America/Chicago";
  keyboardLayout = "us";
  consoleKeyMap = "us";
  terminal = "kitty";

  browser = "firefox";

  wallpaper = "vaporwave-purple.jpg";

  services = [
    {
      name = "ollama";
      port = 8080;
      host = "127.0.0.1";
    }
    {
      name = "emby";
      port = 8096;
    }
    {
      name = "torrents";
      port = 9091;
    }
    {
      name = "prowlarr";
      port = 9696;
    }
    {
      name = "sonarr";
      port = 8989;
    }
    {
      name = "radarr";
      port = 7878;
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
