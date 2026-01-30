{
  pkgs,
  host,
  options,
  ...
}:
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    enableIPv6 = false;
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    firewall = {
      enable = false;
    };
  };

  services.resolved = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
