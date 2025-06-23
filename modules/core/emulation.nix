{ pkgs, unstable, ... }:
{
  # Install emulation packages
  environment.systemPackages = with pkgs; [
    # NES/Famicom emulation
    fceux # Full-featured NES emulator

    # SNES/Super Famicom emulation
    snes9x # Popular SNES emulator

    # N64 emulation
    mupen64plus # Modular N64 emulator

    # GameCube/Wii emulation
    dolphin-emu # The premier GameCube/Wii emulator

    unstable.shadps4
  ];
}
