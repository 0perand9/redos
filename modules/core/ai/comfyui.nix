{ config, pkgs, inputs, ... }:

let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config = config.nixpkgs.config;
  };
in
{
  nixpkgs.overlays = [ inputs.nix-comfyui.overlays.default ];
  
  environment.systemPackages = with pkgs; [
    unstable.comfyuiPackages.comfyui
  ];
}