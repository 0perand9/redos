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

  #TODO remove this when github.com/nixos/nixpkgs/issues/438765 is resolved.
  nixpkgs.overlays = [
    (final: prev: {
      tailscale = prev.tailscale.overrideAttrs (old: {
        doCheck = false;
      });
    })
  ];
  environment.systemPackages = with pkgs; [
    unstable.tailscale
  ];
  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets.tailscale-creds.path;
  };
}
