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

    stockfish
    pychess
  ];
}
