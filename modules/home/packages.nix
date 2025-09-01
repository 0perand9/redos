{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    trezor-suite
    heroic
    dysk

    cliphist

    stockfish
    pychess

    gamescope
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layer
    mesa
    wayland
    wayland-protocols
    libdecor

    libxkbcommon
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr

    runelite
  ];
}