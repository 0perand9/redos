{ host, ... }:
let
  inherit (import ../../hosts/${host}/variables.nix) services;
in
{
  services.nginx = {
    enable = true;

    virtualHosts = builtins.listToAttrs (
      map (service: {
        name = "${service.name}.local.com";
        value = {
          locations."/" = {
            proxyPass = "http://${
              if service ? host then service.host else "localhost"
            }:${toString service.port}/";
            proxyWebsockets = true;
          };
        };
      }) services
    );
  };

  networking.extraHosts = ''
    ${builtins.concatStringsSep "\n" (map (service: "127.0.0.1   ${service.name}.local.com") services)}
  '';
}
