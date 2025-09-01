{ pkgs, ... }:
let
  #per https://www.reddit.com/r/hyprland/comments/1lw3d9x/psa_for_steam_users_with_nvidia_gpus_downgrade/
  oldNixpkgs = import (pkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "01aff802f24988fa4cd78a3e6671df47056645ca";
    sha256 = "sha256-8jp0L/YhqGKmdUt09fTQx4tnc0uZbZGyb3xi3z3xvps="; # You'll need to replace this
  }) { inherit (pkgs) system; };
in
{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;
      gamescopeSession.enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
