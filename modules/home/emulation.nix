{pkgs,...}: {
  # Install emulation packages
  environment.systemPackages = with pkgs; [
    # NES/Famicom emulation
    nestopia       # Accurate NES emulator
    # SNES/Super Famicom emulation
    bsnes-hd       # Highly accurate SNES emulator
    # N64 emulation
    mupen64plus    # Modular N64 emulator
    # GameCube/Wii emulation
    dolphin-emu    # The premier GameCube/Wii emulator
  ];
}