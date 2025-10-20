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
    nftables = {
      enable = true;
      ruleset = ''
        table inet filter {
          chain input {
            type filter hook input priority 0; policy drop;
            
            # Allow established/related connections
            ct state {established, related} accept
            
            # Allow loopback
            iifname "lo" accept
            
            # Drop invalid connections
            ct state invalid drop
            
            # Allow ICMP (ping)
            ip protocol icmp accept
            
            # Allow Tailscale traffic (incoming)
            ip saddr 100.64.0.0/10 accept
            
            # Allow specific TCP ports
            tcp dport { 22, 80, 443, 8000, 8080, 11434, 51413, 59010, 59011, 25565 } accept
            
            # Allow specific UDP ports
            udp dport { 51413, 59010, 59011 } accept
            
            # Allow Tailscale interface
            iifname "tailscale0" accept
          }
          
          chain forward {
            type filter hook forward priority 0; policy drop;
          }
          
          chain output {
            type filter hook output priority 0; policy accept;
          }
        }

        # Mullvad/Tailscale compatibility (bidirectional)
        table inet mullvad_tailscale {
          chain output {
            type route hook output priority 0; policy accept;
            ip daddr 100.64.0.0/10 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
          }
          
          chain input {
            type filter hook input priority -100; policy accept;
            ip saddr 100.64.0.0/10 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
          }
        }
      '';
    };
    enableIPv6 = false;
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
      "127.0.0.1"
    ];
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    firewall = {
      enable = false;
      #   allowedTCPPorts = [
      #     22
      #     80
      #     443
      #     11434
      #     59010
      #     59011
      #     51413
      #     8080
      #     8000
      #   ];
      #   allowedUDPPorts = [
      #     59010
      #     59011
      #     51413
      #   ];
    };
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
    dnsovertls = "true";
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
