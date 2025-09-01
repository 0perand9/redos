{ pkgs, inputs, config, ... }:
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config = config.nixpkgs.config;
  };
in
{
  # Install emulation packages
  environment.systemPackages = with pkgs; [
    # RetroArch with cores for older systems
    retroarch-free
    ryubing

    # GameCube/Wii emulation
    dolphin-emu
    unstable.shadps4
  ];
}
