{
  pkgs,
  inputs,
  config,
  ...
}:
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config = config.nixpkgs.config;
  };
in
{
  age.secrets.tailscale-creds = {
    file = ../../secrets/tailscale-creds.age;
    mode = "600";
  };
  environment.systemPackages = with pkgs; [
    unstable.tailscale
  ];
  systemd.services.tailscaled-autoconnect.enable = false;
  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets.tailscale-creds.path;
    package = unstable.tailscale;
    useRoutingFeatures = "server";
    extraUpFlags = [
      "--reset"
      "--operator=red"
      "--advertise-exit-node"
      "--advertise-routes=192.168.1.0/24"
    ];
  };
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };
}
